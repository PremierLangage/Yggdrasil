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
question_1=<b>Question d'exemple</b>
question_a=<b>Deuxième exemple</b>


# Possibilité de réponses aux questions:
# Doivent être uniques
items==
Choix exemple 1
Choix exemple 2
Choix exemple 3
Choix exemple 4
Choix exemple 5
==

############################################

before==#|python|

import os, sys, time

os.environ["MPLCONFIGDIR"] = "/tmp/matplotlib-ogs20b_w"

from database_utils import get_session, Base, Response
from graph_utils import generate_html_plotly, generate_html_matplotlib
import json, mpld3
from mpld3 import plugins

QUESTIONS = [v for q, v in globals().items() if q.startswith("question_")]
print(QUESTIONS, file=sys.stderr)
NUMBER_QUESTIONS = len(QUESTIONS)


if user__role == "teacher" :
    with get_session(table_class= Response, base=Base) as session:
        answers = session.query(Response.value).all()
    
    data = {v:{} for v in range(NUMBER_QUESTIONS)}
    
    answers_csv = f"username,firsname,lastname,email,{','.join(QUESTIONS)}\\n"


    for answer in answers:
        for k, v in json.loads(str(answer[0])).items():
            data[v][k] = data[v].get(k, 0) + 1
    graphs = [generate_html_plotly(data[i], full_html=False) for i in range(NUMBER_QUESTIONS)]
    # remplacer ici par draw_graphs pour utiliser l'ancienne version
with get_session(table_class= Response, base=Base) as session:
    answer = session.query(Response).filter(Response.student_id == user__id).first()

radio = []
for i in range(len(QUESTIONS)):
    tmp = RadioGroup(cid=str(i))
    tmp.question = QUESTIONS[i]
    tmp.items = []
    for j, item in enumerate(items.splitlines()):        
        tmp.items.append({ "id": j+1, "content": item })
    globals()[str(i)] = tmp
    radio.append(vars(tmp))
==

form==#|html|

{% if user__role == "teacher" %}
<style>
    .mpld3-yaxis { display: none !important; }
    .mpld3-xaxis { display: none !important; }
    @keyframes smooth-select {
        0% {
            opacity: 1.0;
        }
        50% {
            opacity: 0.8;
        }
        100% {
            opacity: 1.0;
        }
    }
    path.mpld3-path:hover {
        animation: smooth-select 2s ease-in-out infinite;
        transform-origin: center !important;
        margin: 0 auto !important; /* Centrer horizontalement */
        outline: none !important;
    }
    @keyframes load-animation {
        0% {
            transform: scale(0.5);
            opacity: 0;
        }
        100% {
            transform: scale(1);
            opacity: 1;
        }
    }
    .mpld3-figure:first-child {
        animation: load-animation 2s ease-in-out;
    }
    .answer {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background-color: light-grey;
        width: 600px;
    }
    .graph {
        border: 2px outset #d4d4d4;
    }
    .c_btn {
        cursor: pointer;
    }
</style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/plotly.js/1.33.1/plotly.min.js" integrity="sha512-V0j9LhrK9IMNdFYZqh+IqU4cjo7wdxyHNyH+L0td4HryBuZ7Oq6QxP2/CWr6TituX31+gv5PnolvERuTbz8UNA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    {% for i in range(NUMBER_QUESTIONS) %}
        <div class="answer">
            <div>{{  radio[i].question|safe }}</div>
            <!-- <div class="graph"> {{ graphs[i]|safe }} </div> -->
            <iframe src="data:text/html;charset=utf-8,{{graphs[i]}}" width="100%" height="400" frameborder="0" scrolling="no"></iframe>
            <iframe class="test">
                <div class="graph"> {{ graphs[i]|safe }} </div>
            </iframe>
        </div>
    {% endfor %}
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


