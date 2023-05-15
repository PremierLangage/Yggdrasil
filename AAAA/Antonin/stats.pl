@database_utils.py
@graph_utils.py
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

################### Modifier ici ###########################
author = Thomas Saillard & Antonin Jean

# Ecrire un titre ici
title= dummy title

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

############################################

before==#|python|

import os, sys, time

from database_utils import get_session, Base, Response
from stat_utils import Stat, StatInput

QUESTIONS = [v for q, v in globals().items() if q.startswith("question_")]
NUMBER_QUESTIONS = len(QUESTIONS)

with get_session(table_class= Response, base=Base) as session:
    HAS_ANSWERED = (session.query(Response).filter(Response.student_id == user__id).first()) != None

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
    with get_session(table_class= Response, base=Base) as session:
        answers = session.query(Response.value).all()
    
    data = {v:{} for v in range(NUMBER_QUESTIONS)}
    
    answers_csv = f"username,firsname,lastname,email,{','.join(QUESTIONS)}\\n"


    for answer in answers:
        for k, v in json.loads(str(answer[0])).items():
            data[v][k] = data[v].get(k, 0) + 1
    # GRAPH GENERATION
    statInputs = [StatInput(QUESTIONS[i], data[i].items()) for i in range(NUMBER_QUESTIONS)]
    stat = Stat(statInputs)
    graphContent = stat.get_graph_as_html(containsScript=True)
==

form==#|html|

{% if user__role == "teacher" %}
<style>
</style>
    <div class="graph">
        {{graphContent|safe}}
    </div>
    <br>
    <br>
    <div class="exercise__actions text-center">
        <div class="btn btn-primary c_btn" id="dwn-btn"> 
            <i class="fas fa-download"></i>
            <span class="ion-hide-md-down">Téléchargement des choix des élèves</span>
        </div>
    </div>
    <script>
        function download(filename, text) {
            var element = document.createElement('a');
            element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
            element.setAttribute('download', filename);

            element.style.display = 'none';
            document.body.appendChild(element);

            element.click();

            document.body.removeChild(element);
        }

        // Start file download.
        document.getElementById("dwn-btn").addEventListener("click", function(){
            // Generate download of hello.txt file with some content
            var text = "{{answers_csv}}";
            var filename = "answers.csv";
            
            download(filename, text);
        }, false);
    </script>
{% else %}
    {% if False and answer != None %}
        <span class="success-state">Vous avez déjà répondu à ce sondage</span>
    {% else %}
        {% for r in radio %}
            {{ r.question|safe }}

            {{ r|component }}

        {% endfor %}
    {% endif %}
{% endif %}

==

# EVALUATE THE STUDENT ANSWER
evaluator == #|py|
from database_utils import get_session, Base, Response
import json

score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'

answer = {}
for i, r in enumerate(radio):
    answer[ response[str(i)]['items'][ int(response[str(i)]['selection'])-1 ]['content'] ] = i


if len(answer) != int(NUMBER_QUESTIONS):
    score = 0

if int(score) == 100:
    with get_session(table_class = Response, base=Base) as session:
        session.add(
            Response(student_id = user__id if user__id else session__id, 
            username = user__username,
            firstname = user__firstname,
            lastname = user__lastname,
            email = user__email,
            value = json.dumps(answer)))
        session.commit()
else :
    feedback = '<span class="error-state">Vous ne pouvez pas sélectionner plusieurs fois la même option</span>'

grade = (score, feedback)
==


