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
dummy statement
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
Dummy choice 1
Dummy choice 2
==

NUMBER_QUESTIONS=3

############################################

before==#|python|

import os

os.environ["MPLCONFIGDIR"] = "/tmp/matplotlib-ogs20b_w"

from database_utils import get_session, Base, Response
from graph_utils import draw_hist, draw_camembert, draw_graphs
import json, mpld3
from mpld3 import plugins

if user__role == "teacher" :
    with get_session(table_class= Response, base=Base) as session:
        answers = session.query(Response.value).all()
    
    data = {v:{} for v in range(int(NUMBER_QUESTIONS))}
    answers_csv = f"username,firsname,lastname,email,{','.join(eval(str('question'+str(i+1))) for i in range(int(NUMBER_QUESTIONS)))}\\n"


    for answer in answers:
        for k, v in json.loads(str(answer[0])).items():
            data[v][k] = data[v].get(k, 0) + 1

    graphs = [draw_graphs(data[i]) for i in range(int(NUMBER_QUESTIONS))]
        

with get_session(table_class= Response, base=Base) as session:
    answer = session.query(Response).filter(Response.student_id == user__id).first()

radio = []
questions = [q for q in globals() if q.startswith("question_")]
for i in range(len(questions)):
    tmp = RadioGroup(cid=str(i))
    tmp.question = questions[i]
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
        padding: 18px;
        margin: 18px;
    }
    .graph {
        border: 2px outset #d4d4d4;
        transform-origin: center !important;
    }
    .c_btn {
        cursor: pointer;
    }
</style>

    
    {% if answer != None %}
        <span class="success-state">Vous avez déjà répondu à ce sondage</span>
    {% else %}
        {% for i in [0,1,2] %}
            <div class="answer">
                <div>{{  radio[i].question|safe }}</div>

                <div class="graph">{{ graphs[i]|safe }}</div>
            </div>
        {% endfor %}
    {% endif %}
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
    {% if answer != None %}
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
        session.add(Response(student_id = user__id if user__id else session__id, value = json.dumps(answer)))
        session.commit()
else :
    feedback = '<span class="error-state">Vous ne pouvez pas sélectionner plusieurs fois la même option</span>'

grade = (score, feedback)
==


