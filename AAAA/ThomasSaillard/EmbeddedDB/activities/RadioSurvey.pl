extends = /AAAA/ThomasSaillard/EmbeddedDB/stats.pl
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
import json
from database_utils import get_session, Base, RadioResponse
import utils
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

questions = list(inputValues.keys())
questions_name = [inputValues[i]["question"] for i in questions]
number_questions = len(questions)

data = {}
answers_csv = CsvStringBuilder(["username", "firstname", "lastname", "email", "grade"] + questions)

radio = []
for i, key in enumerate(inputValues):    
    tmp = RadioGroup(cid=f"radio_{questions[i]}")
    tmp.question = inputValues[key]["question"]
    tmp.items =  [{"id": f"item_{key}_{i}",  "content": i} for i in inputValues[key]["items"]]
    globals()[f"radio_{questions[i]}"] = tmp
    radio.append(vars(tmp))

if user__role == "teacher" and number_questions != 0:
    for i in inputValues:           
        labels = inputValues[i]["items"]
        data[inputValues[i]["question"]] = [labels, []]
        if len(inputValues[i]) > 2:
            data[inputValues[i]["question"]].append(inputValues[i]["horizontal"])

    with get_session(table_class=RadioResponse, base=Base) as session:
        answers = session.query(RadioResponse).all()
    for answer in answers:
        line_csv = [answer.username,answer.firstname,answer.lastname,answer.email,answer.grade]
        for i, q in json.loads(str(answer.value)).items():
            data[inputValues[i]["question"]][1].append(q)
            line_csv.append(q)
        answers_csv.addLine(line_csv)
globals()["data"] = data
globals()["answers_csv"] = str(answers_csv)
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
    sel = response[f"radio_{questions[i]}"]["selection"]
    answer[questions[i]] = ''.join([i["content"] for i in response[f"radio_{questions[i]}"]["items"] if i["id"] == sel])
# Default Grade intilisation
score = 100
feedback = f'<span class="success-state">Réponse enregistrée</span>'

class Question:
    def __init__(self, name, items, answer):
        self.name = name
        self.items = items
        self.answer = answer

def get_question(_id: str):
    v = inputValues.get(_id)
    if not v: return None
    return Question(v["question"], v["items"], answer[_id])
==

#default evaluator
evaluator==#|py| 
==

evaluator_after == #|py|
if (unique_choice != "False") and (len(set(answer.values())) != int(number_questions)):
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