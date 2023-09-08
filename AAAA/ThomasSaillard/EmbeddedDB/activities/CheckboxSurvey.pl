extends = /AAAA/ThomasSaillard/EmbeddedDB/stats.pl
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

# Flags:
# L'utilisateur doit-il choisir une réponse différente par question
all_possibilities = False


# Role : Traitement donnée, 
# - doit remplir la variable globale : data
# - doit remplir la variable globale : answers_csv
# Format spécifié dans le fichier stats.pl
before==#|python|
from database_utils import get_session, Base, CheckboxResponse
import json, utils

def getValuesAsString(values: list) -> str:
    return ' - '.join(map(str, values))

def get_combinations(lst):
    result = []
    n = len(lst)
    
    # Générer les combinaisons de 1 à n éléments
    for r in range(1, n+1):
        result.extend(list(combinations(lst, r)))
    
    return list(map(getValuesAsString,result))

    
inputValues = {k[len("question_"):] : {"question": v, "items": []} for k, v in globals().items() if k.startswith("question_")} 
for k, v in [(k, v) for k, v in globals().items() if k.startswith("items_")]:
    k = k[len("items_"):]
    if k in inputValues:
        inputValues[k]["items"] = v.splitlines()
# Processing horizontal graph data
horizontales_data = {k[len("graph_horizontal_"):] : v for k, v in [(k, v) for k, v in globals().items() if k.startswith("graph_horizontal_")]}
for _title in inputValues:
    if _title in horizontales_data:
        inputValues[_title]["horizontal"] = horizontales_data[_title]
# Processing combinations graph data
combinations_data = {k[len("graph_combinations_"):] : v for k, v in [(k, v) for k, v in globals().items() if k.startswith("graph_combinations_")]}
for _title in inputValues:
    if _title in combinations_data:
        inputValues[_title]["combinations"] = True

questions = list(inputValues.keys())
questions_name = [inputValues[i]["question"] for i in questions]
number_questions = len(questions)
data = {}
header = ["username", "firstname", "lastname", "email", "grade"]
for key in inputValues:
    header.append(inputValues[key]['question'])
    header += inputValues[key]['items']

answers_csv = CsvStringBuilder(header)
#answers_csv = f"username,firstname,lastname,email,{','.join([','.join([inputValues[key]['question']] + inputValues[key]['items']) for key in inputValues])}\\n"

checkBoxs = []
for i, key in enumerate(inputValues):
    tmp = CheckboxGroup(cid=f"checkbox_{questions[i]}")
    tmp.items = [{"id": f"item_{key}_{i}",  "content": i} for i in inputValues[key]["items"]]
    globals()[f"checkbox_{questions[i]}"] = tmp
    checkBoxs.append(vars(tmp))

if user__role == "teacher" and number_questions != 0:
    for i in inputValues:           
        labels = get_combinations(inputValues[i]["items"]) if all_possibilities != 'False' else []
        if inputValues[i].get("combinations"): 
            data["Représentation choix : " + inputValues[i]["question"]] = [labels, []]
        data[inputValues[i]["question"]] = [inputValues[i]["items"], []]
        if len(inputValues[i]) > 2:
            if inputValues[i].get("combinations"): 
                data["Représentation choix : " + inputValues[i]["question"]].append(inputValues[i]["horizontal"])
            data[inputValues[i]["question"]].append(inputValues[i]["horizontal"])

    with get_session(table_class=CheckboxResponse, base=Base) as session:
        answers = session.query(CheckboxResponse).all()
    
    for answer in answers:
        line_csv = [answer.username,answer.firstname,answer.lastname,answer.email,answer.grade]
        for q, i in json.loads(str(answer.values)).items():
            question, items = i
            if data.get("Représentation choix : " + question):
                data["Représentation choix : " + question][1].append(getValuesAsString(items))
            data[question][1] += list(map(str, items))
            line_csv += [question] + [1 if e in items else 0 for e in inputValues[q]["items"]]
        answers_csv.addLine(line_csv)
checkBoxsI = list(enumerate(checkBoxs))
globals()["data"] = data
globals()["answers_csv"] = str(answers_csv)
==

# Bloc html définissant le bloc utilisateur permettant de remplir des données pour les stats
# C'est la partie jouable de l'exercice
formstudent==#|html|
{% if False and HAS_ANSWERED != None %}
        <span class="success-state">Vous avez déjà répondu à ce sondage</span>
{% else %}
    {% for i, g in checkBoxsI %}
        <b>{{ questions_name[i]|safe }}</b>

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
    answer[questions[i]] = (questions_name[i], [i['content'] for i in response[f"checkbox_{questions[i]}"]['items'] if i["checked"]])


class Question:
    def __init__(self, name, items, answers):
        self.name = name
        self.items = items
        self.answers = answers

def get_question(_id: str):
    v = inputValues.get(_id)
    if not v: return None
    return Question(v["question"], v["items"], answer[_id][1])


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