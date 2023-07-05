@utils/database_utils.py
@utils/graph_utils.py
@utils/stats_utils.py
@utils/utils.py

@ /utils/sandboxio.py
builder =@ statbefore.py
grader  =@ statevaluator.py

author = Thomas Saillard & Antonin Jean
title= Statistic Activity
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

# ===============================================
# Flags:
# ===============================================
# Statistiques de score:
include_stats_score = False
# Statistiques de participation:
include_stats_participation = False

# ===============================================
# Values required for the program to work
# ===============================================
# Can (should) be redefined in implementations (see doc)
data % {"test1": [[0,1,2,3], [1,2,2,3,3,3]], "test":  [["rien", "coucou", "test", "a"], ["coucou", "test", "a", "a"], "1"]}

answers_csv="username,firsname,lastname,email,title,statement,grade\\n"
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
}
.ascii-animation-inner {
  width: 162ch;
  animation: pew-pew 10s steps(18, end) infinite;
  position: relative;
}

@keyframes pew-pew {
  0% {
     left: 0;
  }
  100% {
     left: -162ch;
  }
}
</style>
<div style="display:flex; flex-direction:column">
    <b style="color: red">No form Student were defined</b>
    <p>
        Please define a field <code>formstudent</code> into your pl file to define a playable form for student
    </p>
    <i> Here is a little sleepy cat while you write your thing ... </i>
    <div class="ascii-animation">
        <div class="ascii-animation-inner">
\     /\   /   /\ \     ^^   /   ^^ \     ^^   /   ^^ \     ^^   /   ^^ \     /\   /   /\ \     /\   /   /\ \     /\   /   /\ \     /\   /   /\ \     /\   /   /\ 
 )   ( ') (   ( ') )   ('') (   ('') )   (--) (   (--) )   (--) (   ('') )   ( ') (   ( ') )   ( -) (   ( -) )   ( -) (   ( -) )   ( -) (   ( -) )   ( -) (   ( -)
 (  /  )   ) /  )  (  /  )   ) /  )  (  /  )   ) /  )  (  /  )   ) /  )  (  /  )   ) /  )  (  /  )   ) /  )  (  /  )   ) /  )  (  /  )   ) /  )  (  /  )   ) /  ) 
  \(__)|   ((__)|   \(__)|   ((__)|   \(__)|   ((__)|   \(__)|   ((__)|   \(__)|   ((__)|   \(__)|   ((__)|   \(__)|   ((__)|   \(__)|   ((__)|   \(__)|   ((__)| 
        </div>
    </div>
</div>
==

# ===============================================
# Stat handling
# ===============================================
before_stat==#|python|
with open("database_utils.py", "r+") as f:
    f.seek(0, 0)
    f.write(f"activity_id={activity__id}")

from database_utils import get_session, get_session, Base, Response
from stats_utils import Stat, StatInput, CsvStringBuilder
from utils import *

with get_session(table_class= Response, base=Base) as session:
    HAS_ANSWERED = (session.query(Response).filter(Response.student_id == user__id).first()) != None
==
# ===============================================
# Data handling
# ===============================================

before==#|python|
# Nothing, work is done in implementations
# needs to be overwriten
==

teacher_name=dummy name to change

# ===============================================
# Graph generation
# ===============================================
before_graph==#|python|
from collections import Counter
import utils
if user__lastname.lower() == teacher_name:
    # Processing datas
    statInputs = [StatInput.from_data(d) for d in data.items()]
    # Generating default graphs
    if (include_stats_score != "False"):
        values = []
        labels = []

        with get_session(table_class=Response, base=Base) as session:
            answers = session.query(Response.grade).all()
        for answer in answers:
            values.append(answer[0]) # mapping row -> int
        [labels.append(x) for x in values if x not in labels]
        labels.sort()
        statInputs.append(StatInput("Score", values, labels))
    if (include_stats_participation != "False"):
        values = []
        labels = []

        with get_session(table_class=Response, base=Base) as session:
            answers = session.query(Response.student_id).all()
        for answer in Counter(answers).values():
            values.append(answer) # mapping row -> int
        [labels.append(x) for x in values if x not in labels]
        labels.sort()

        statInputs.append(StatInput("Participation", values, labels))
    # Graph generation
    stat = Stat(statInputs)
    graphContent = stat.get_graph_as_html(containsScript=True)
==

# FORM PLAYER
form==#|html|
{% if user__lastname.lower() == teacher_name %}
<style>
    .graph {
        display:flex;
        flex-direction:column;
    }
</style>
    <div class="graph">
        {{graphContent|safe}}
    </div>
    <br>
    {{ corrections }}
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
