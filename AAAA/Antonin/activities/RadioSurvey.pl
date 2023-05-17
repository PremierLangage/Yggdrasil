extends = /AAAA/Antonin/stats.pl

# Ecrire un titre ici
title= Test title

# Ecrire un énoncé ici
text ==#|markdown|
Ici vous pouvez définir une activité de RadioGroup incluant le module de Statistique:

    - exercice radio : selection de choix répondant à une liste de question

    - affichage de graphe (histogramme) représentant les données pour l'enseignant

    - récupération des entrées au format `csv`

---

**Manuel utilisateur:**

Pour ce faire vous devez définir les variables globales suivantes:

- Un ensemble de question au format suivant : **`question_X`**:

    Où X est un identifiant se devant d'être unique et n'ayant aucune incidence dans la suite du code.


    Exemple:

    > ```question_1 = Que pensez-vous de ce tutoriel ?```

    > ```question_plus_pertinente = Est-ce que vous aussi vous avez du mal à finir vos...```

- Une liste de réponses possibles dans une variable **`items`**, une réponse équivaut à une ligne:


 
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

# Possibilité de réponses aux questions:
# Doivent être uniques
items==
Dummy
Test
==

before==#|python|
import json, sys
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
    print(f"1 - {items}", file=sys.stderr)
    labels = items.splitlines()
    data = { q : [labels, []] for q in QUESTIONS}
    print(f"2 - {data}", file=sys.stderr)
    answers_csv = f"username,firsname,lastname,email,{','.join(QUESTIONS)}\\n"
    with get_session(table_class= RadioResponse, base=Base) as session:
        answers = session.query(RadioResponse.value).all()
 
    for answer in answers:
        for k, v in json.loads(str(answer[0])).items():
            data[QUESTIONS[int(v)]][1].append(k)
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