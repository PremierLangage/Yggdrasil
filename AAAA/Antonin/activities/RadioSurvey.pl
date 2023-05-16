extends = /AAAA/Antonin/stats.pl

# Ecrire un titre ici
title= Test title

# Ecrire un énoncé ici
text ==
Vous pouvez définir des questions au format suivant : `question_X`

Où X est un identifiant se devant d'être unique et n'ayant aucune incidence dans la suite du code.
 
---

<u>exemples :</u>

> **question_1**=`<b>première question</b>`

> **question_a**=`<b>deuxième question</b>`
==

# Vous pouvez définir des questions au format suivant : question_X
# Où X est un identifiant se devant d'être unique et n'ayant aucune
# incidence dans la suite du code.
#
# exemple :
# question_1=<b>première question</b>
# question_a=<b>deuxième question</b>
question_1=<b>première question</b>
question_a=<b>deuxième question</b>

# Possibilité de réponses aux questions:
# Doivent être uniques
items==
pas du tout d'accord 
pas d'accord
sans option
d'accord
tout à fait d'accord
==

before==#|python|

from database_utils import get_session, Base, RadioResponse

QUESTIONS = [v for q, v in globals().items() if q.startswith("question_")]
NUMBER_QUESTIONS = len(QUESTIONS)

radio = []
for i in range(len(QUESTIONS)):
    tmp = RadioGroup(cid=str(i))
    tmp.question = QUESTIONS[i]
    tmp.items = []
    for j, item in enumerate(items.splitlines()):        
        tmp.items.append({ "id": j+1, "content": item })
    globals()[str(i)] = tmp
    radio.append(vars(tmp))

if user__role == "teacher":
    labels = items.splitlines()
    data = { v : [[labels], []] for v in range(NUMBER_QUESTIONS)}
    answers_csv = f"username,firsname,lastname,email,{','.join(QUESTIONS)}\\n"
    with get_session(table_class= RadioResponse, base=Base) as session:
        answers = session.query(RadioResponse.value).all()
 
    for answer in answers:
        for k, v in json.loads(str(answer[0])).items():
            data[v][1].append(k)
    globals()["data"] = data
==

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

# EVALUATE THE STUDENT ANSWER
evaluator == #|py|
from database_utils import get_session, Base, RadioResponse
import json

score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'

answer = {}
for i, r in enumerate(radio):
    answer[ response[str(i)]['items'][ int(response[str(i)]['selection'])-1 ]['content'] ] = i


if len(answer) != int(NUMBER_QUESTIONS):
    score = 0

if int(score) == 100:
    with get_session(table_class = RadioResponse, base=Base) as session:
        session.add(
            RadioResponse(student_id = user__id if user__id else session__id, 
            username    = user__username,
            firstname   = user__firstname,
            lastname    = user__lastname,
            email       = user__email,
            title       = title,
            text        = text,
            grade       = 100,
            value       = json.dumps(answer)))
        session.commit()
else :
    feedback = '<span class="error-state">Vous ne pouvez pas sélectionner plusieurs fois la même option</span>'

grade = (score, feedback)
==