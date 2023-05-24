extends = /AAAA/Antonin/stats.pl
# ===============================================
# Documentation Loading
evaluation =@ ../docs/radioSurvey/evaluation.md
options =@ ../docs/radioSurvey/options.md
summary =@ ../docs/radioSurvey/summary.md
user_manual =@ ../docs/radioSurvey/user_manual.md
# ===============================================

title= Dummy Title RadioSurvey

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

# Flags:
# L'utilisateur doit-il choisir une réponse différente par question
unique_choice = False

# Role : Traitement donnée, 
# - doit remplir la variable globale : data
# - doit remplir la variable globale : answers_csv
# Format spécifié dans le fichier stats.pl
before==#|python|
import json, sys
from database_utils import get_session, Base, RadioResponse

questions = [v for q, v in globals().items() if q.startswith("question_")]
number_questions = len(questions)

radio = []
for i in range(len(questions)):
    tmp = RadioGroup(cid=str(i))
    tmp.question = questions[i]
    tmp.items = []
    for j, item in enumerate(items.splitlines()):        
        tmp.items.append({ "id": j+1, "content": item })
    globals()[str(i)] = tmp
    radio.append(vars(tmp))

if number_questions != 0:
    labels = items.splitlines()
    data = { q : [labels, []] for q in questions}
    answers_csv = f"username,firsname,lastname,email,{','.join(questions)}\\n"
    with get_session(table_class=RadioResponse, base=Base) as session:
        answers = session.query(RadioResponse).all()
    
    for answer in answers:
        line_csv = [answer.username,answer.firstname,answer.lastname,answer.email]
        for i, q in json.loads(str(answer.value)).items():
            data[questions[int(i)]][1].append(q)
            line_csv.append(q)
        answers_csv += ','.join(line_csv) + '\\n'
    globals()["data"] = data
    globals()["answers_csv"] = answers_csv
==

# Bloc html définissant le bloc utilisateur permettant de remplir des données pour les stats
# C'est la partie jouable de l'exercice
formstudent==#|html|
{% if False and HAS_ANSWERED != None %}
        <span class="success-state">Vous avez déjà répondu à ce sondage</span>
{% else %}
    {% for r in radio %}
        {{ r.question|safe }}

        {{ r|component }}

    {% endfor %} 
{% endif %}
==

# Evaluation de la réponse de l'étudiant
evaluator_before == #|py|
from database_utils import get_session, Base, RadioResponse
import json
from utils import *

answer = {}
for i in range(len(radio)):
    answer[ i ] = response[str(i)]['items'][ int(response[str(i)]['selection'])-1 ]['content']

# Default Grade intilisation
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'
==

#default evaluator
evaluator==#|py| 
==

evaluator_after == #|py|
if (unique_choice != "False") and (len(answer) != int(number_questions)):
    score = -1
if int(score) >= 0:
    with get_session(table_class = RadioResponse, base=Base) as session:
        session.add(
            RadioResponse(
                student_id = user__id if user__id else session__id, 
                username    = user__username,
                firstname   = user__firstname,
                lastname    = user__lastname,
                email       = user__email,
                title       = title,
                text        = text,
                grade       = score,
                value       = json.dumps(answer),
                feedback    = feedback
            ))
        session.commit()
else :
    feedback = '<span class="error-state">Vous ne pouvez pas sélectionner plusieurs fois la même option</span>'

grade = (score, feedback)
==