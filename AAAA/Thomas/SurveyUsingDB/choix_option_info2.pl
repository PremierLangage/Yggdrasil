#*****************************************************************************
#  Copyright (C) 2023 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@database_utils.py
@graph_utils.py
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

################### Modifier ici ###########################
author=ESIEE info AD&D année 1

title=Vos choix d'options personnels

text ==
Sans consultation de vos maitres d'apprentissage et seulement en interrogeant vos goûts personnels, veuillez 
classer les trois options de votre premier voeux (l'option qui vous interesse le plus) à votre troisième voeux 
(l'option qui vous interesse le moins).
==

question1=<b>Quel est votre premier choix d'option ?</b>

question2=<b>Quel est votre second choix d'option ?</b>

question3=<b>Quel est votre troisième choix d'option ?</b>

items==
Géomatique
Logiciel
Réseaux
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
    
    for answer in answers:
        for k, v in json.loads(str(answer[0])).items():
            data[v][k] = data[v].get(k, 0) + 1

    hist = draw_hist(data[0])
    hist = mpld3.fig_to_html(hist)

    camembert = draw_camembert(data[0])
    camembert = mpld3.fig_to_html(camembert)

    graphs = [draw_graphs(data[i]) for i in range(NUMBER_QUESTIONS)]
    


with get_session(table_class= Response, base=Base) as session:
    answer = session.query(Response).filter(Response.student_id == user__id).first()

radio = []

for i in range(int(NUMBER_QUESTIONS)):
    tmp = RadioGroup(cid=str(i))
    tmp.question = globals()["question"+str(i+1)]
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

    .answer {
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: green;
        padding: 18px;
        margin: 18px;
    }
    
</style>

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
    var text = {{answers_csv}};
    var filename = "answers.csv";
    
    download(filename, text);
}, false);
    </script>
    
    {% if answer != None %}
        <span class="success-state">Vous avez déjà répondu à ce sondage</span>
    {% else %}
        {% for i in [0,1,2] %}
            <div class="answer">
                <div>{{ radio[i].question|safe }}</div>

                <div>{{ graphs[i]|safe}}</div>
            </div>
        {% endfor %}
    {% endif %}
    <br>
    <br>
    <input type="button" id="dwn-btn" value="Téléchargement des choix des élèves"/>
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

