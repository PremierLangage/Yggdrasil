extends = /AAAA/Antonin/stats.pl
# ===============================================
# Documentation Loading
evaluation =@ ../docs/checkbox/evaluation.md
options =@ ../docs/checkbox/options.md
summary =@ ../docs/checkbox/summary.md
user_manual =@ ../docs/checkbox/user_manual.md
# ===============================================

title= Dummy Title CheckboxSurvey

text ==#|markdown|
# Documentation:

{{summary}}

---

## Manuel Utilisateur:

{{user_manual}}

---

## Options:

{{options}}

---

## Evaluation

{{evaluation}}

---
==

question_a = testa
items_a==
A
B
C
==

question_b = testb
items_b==
Ab
Bb
==
# Role : Traitement donnée, 
# - doit remplir la variable globale : data
# - doit remplir la variable globale : answers_csv
# Format spécifié dans le fichier stats.pl
before==#|python|
from database_utils import get_session, Base, CheckboxResponse
import json

inputValues = {k[len("question_"):] : {"question": v, "items": []} for k, v in globals().items() if k.startswith("question_")} 
for k, v in [(k, v) for k, v in globals().items() if k.startswith("items_")]:
    k = k[len("items_"):]
    if k in inputValues:
        inputValues[k]["items"] = v.splitlines()

questions = list(inputValues.keys())
number_questions = len(questions)
data = {}
answers_csv = f"username,firsname,lastname,email,{','.join([','.join([inputValues[key]['question']] + inputValues[key]['items']) for key in inputValues])}\\n"

checkBoxs = []
for i, key in enumerate(inputValues):
    tmp = CheckboxGroup(cid=f"checkbox_{questions[i]}")
    tmp.items = [{"id": f"item_{key}_{i}",  "content": i} for i in inputValues[key]["items"]]
    globals()[f"checkbox_{questions[i]}"] = tmp
    checkBoxs.append(vars(tmp))

if user__role =="teacher" and number_questions != 0:
    data = { inputValues[i]["question"] : [inputValues[i]["items"], []] for i in inputValues}
    with get_session(table_class=CheckboxResponse, base=Base) as session:
        answers = session.query(CheckboxResponse).all()
    
    for answer in answers:
        line_csv = [answer.username,answer.firstname,answer.lastname,answer.email]
        for q, items in json.loads(str(answer.values)).items():
            data[q][1].append(items)
            line_csv += [q] + items
        answers_csv += ','.join(line_csv) + '\\n'

checkBoxsI = list(enumerate(checkBoxs))
globals()["data"] = data
globals()["answers_csv"] = answers_csv
==

# Bloc html définissant le bloc utilisateur permettant de remplir des données pour les stats
# C'est la partie jouable de l'exercice
formstudent==#|html|
{{data}}
{% if False and HAS_ANSWERED != None %}
        <span class="success-state">Vous avez déjà répondu à ce sondage</span>
{% else %}
    {% for i, g in checkBoxsI %}
        <b>{{ questions[i]|safe }}</b>

        {{ g|component }}

    {% endfor %} 
{% endif %}
==

# Evaluation de la réponse de l'étudiant
evaluator_before == #|py|
from database_utils import get_session, Base, CheckboxResponse
import json, utils

answer = {}
for i in range(len(checkBoxs)):
    answer[ questions[i] ] = [int(i['checked']) for i in response[f"checkbox_{questions[i]}"]['items']]

# Default Grade intilisation
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'
==

#default evaluator
evaluator==#|py| 
==

evaluator_after == #|py|
if int(score) >= 0:
    with get_session(table_class = CheckboxResponse, base=Base) as session:
        session.add(
            CheckboxResponse(
                student_id = user__id if user__id else session__id, 
                username    = user__username,
                firstname   = user__firstname,
                lastname    = user__lastname,
                email       = user__email,
                title       = title,
                text        = text,
                grade       = score,
                feedback    = feedback,
                values       = json.dumps(answer)
            ))
        session.commit()
else :
    feedback = '<span class="error-state">Votre entrée est invalide</span>'

grade = (score, feedback)
==