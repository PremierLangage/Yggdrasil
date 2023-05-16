@database_utils.py
@graph_utils.py
@stats_utils.py


@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ statbefore.py

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

data % {"value": [1,1,1,1,2,4,5,2,5,5,5,5], "test": ["coucou", "test", "a", "b", "a", "coucou"]}
answer_csv="username,firsname,lastname,email,title,statement,grade\\n"
formstudent==#|html|
<style>
.ascii-animation { 
  font-family: monospace;
  width: 9ch;
  margin: 0;
  padding: 0;
  white-space: pre;
  overflow: hidden;
  position: relative;
  &:hover {
    overflow: auto;
    
    .ascii-animation-inner {
      animation: none;
    }
  }
}

.ascii-animation-inner {
  width: 90ch;
  animation: pew-pew 5s steps(10, end) infinite alternate;
  position: relative;
}

@keyframes pew-pew {
  0% {
     left: 0;
  }
  100% {
     left: -90ch;
  }
}
</style>
<div style="display:flex; flex-direction:column">
    <b style="color: red">No form Student were defined</b>
    <p>
        Please define a field <code>formstudent</code> into your pl file to define a playable form for student
    </p>
<div class="ascii-animation"><div class="ascii-animation-inner">
\     /\   /   /\ \     ^^   /   ^^ \     ^^   /   ^^ \     ^^   /   ^^ \     /\   /   /\ 
 )   ( ') (   ( ') )   (',) (   ('') )   (--) (   (--) )   ('') (   (',) )   ( ') (   ( ')
 (  /  )   ) /  )  (  /  )   ) /  )  (  /  )   ) /  )  (  /  )   ) /  )  (  /  )   ) /  ) 
  \(__)|   ((__)|   \(__)|   ((__)|   \(__)|   ((__)|   \(__)|   ((__)|   \(__)|   ((__)| 
</div></div>
</div>
==

before_stat==#|python|
import os, sys, time, json
from database_utils import get_session, Base, Response
from stats_utils import Stat, StatInput

with get_session(table_class= Response, base=Base) as session:
    HAS_ANSWERED = (session.query(Response).filter(Response.student_id == user__id).first()) != None
==

before==#|python|
# Nothing, work is done in implementations
# needs to be overwriten
==

before_graph==#|python|
# GRAPH GENERATION
print(data, type(data), type(data["value"]), file=sys.stderr)
statInputs = [StatInput(k, v) for k, v in data.items()]
stat = Stat(statInputs)

graphContent = stat.get_graph_as_html(containsScript=True)
==

form==#|html|
{% if user__role != "teacher" %}
<style>
    .graph {
        display:flex;
        flex-direction:column;
    }
</style>
{{data}}
    <div class="graph">
        <h4><u>Graphiques:</u></h4>
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
    {{formstudent|safe}}
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
            value       = json.dumps(answer)))
        session.commit()
else :
    feedback = '<span class="error-state">Vous ne pouvez pas sélectionner plusieurs fois la même option</span>'

grade = (score, feedback)
==


