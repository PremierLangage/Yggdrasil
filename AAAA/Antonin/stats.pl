@database_utils.py
@graph_utils.py
@stats_utils.py
@database_name.py
@utils.py

@ /utils/sandboxio.py
builder =@ statbefore.py
grader  =@ statevaluator.py

################### Modifier ici ###########################
author = Thomas Saillard & Antonin Jean

# Ecrire un titre ici
title= Statistic Activity

# Ecrire un énoncé ici
text ==#|markdown|
Ici vous pouvez définir une activité intégrant un système de statistiques:

- affichage de graphe (histogramme) représentant les données pour l'enseignant

- récupération des entrées au format `csv`

---

**Manuel utilisateur:**

Pour ce faire vous devez définir les variables globales suivantes:

- **`data`** : dictionnaire contenant les données au format : 

    - **key   :** str : nom graphe

    - **value :** list : Couple contenant les labels (valeurs possibles) et les values (valeurs)
        
        - **labels :** list : valeurs possibles (seront représentées sur l'histogramme)

        - **values :** list : valeurs à afficher dans l'histogramme

    Exemple: 
    
    - ```data % {"test1": [[0,1,2,3], [1,2,2,3,3,3]], "test": [["rien", "coucou", "test", "a"], ["coucou", "test", "a", "a"]]}```

- **`answer_csv`** : string représentant le format d'une ligne du csv

    Exemple: 
    
    - ```answer_csv="username,firsname,lastname,email,title,statement,grade\\n"```

- **`formstudent`** : block html au format string représentant la partie jouable par un utilisateur lambda

    Exemple: 
    
    `formstudent==#|html|`

    `<h2> Hello World ! </h2>`
    
    `==`


<u>**Options:**</u>

{{options}}

---
==

options==#|markdown|

[Options stats.pl](https://pl-preprod.u-pem.fr/filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/stats.pl)

-  **`include_stats_score`** : `Boolean`   -   Défaut: `False`

    - Afficher le graphe représentant le score des utilisateurs

    Exemple:

    - ```include_stats_score = True```

-  **`include_stats_participation`** : `Boolean`   -   Défaut: `False`

    - Afficher le graphe représentant le taux de participation des utilisateurs

    Exemple:

    - ```include_stats_participation = True```
==

# Flags:
# Statistiques de score:
include_stats_score = False
# Statistiques de participation:
include_stats_participation = False

############################################
data % {"test1": [[0,1,2,3], [1,2,2,3,3,3]], "test":  [["rien", "coucou", "test", "a"], ["coucou", "test", "a", "a"]]}
dataType % {"type": "Response"}
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

before_stat==#|python|

with open("database_utils.py", "r+") as f:
    f.seek(0, 0)
    f.write(f"activity_id={activity__id}")

from database_utils import get_session, Base, Response, CodeEditorResponse
from stats_utils import Stat, StatInput
from utils import *
log(dataType["type"])
a = eval(dataType["type"])
log(globals())
log(type(a))
log(type(Response))
log(a)
log_print()
with get_session(table_class= Response, base=Base) as session:
    HAS_ANSWERED = (session.query(Response).filter(Response.student_id == user__id).first()) != None
==

before==#|python|
# Nothing, work is done in implementations
# needs to be overwriten
==

before_graph==#|python|
from collections import Counter
# GRAPH GENERATION
statInputs = [StatInput(title, values, labels) for title, (labels, values) in data.items()]
if (include_stats_score != "False"):
    values = []
    labels = []
    with get_session(table_class=Response, base=Base) as session:
        answers = session.query(Response.grade).all()
    for answer in answers:
        values.append(answer[0]) # mapping row -> int
    [labels.append(x) for x in values if x not in labels]
    labels.sort()
    statInputs.append(StatInput("__Score__", values, labels))
if (include_stats_participation != "False"):
    values = []
    labels = []
    with get_session(table_class=Response, base=Base) as session:
        answers = session.query(Response.student_id).all()
    for answer in Counter(answers).values():
        values.append(answer) # mapping row -> int
    [labels.append(x) for x in values if x not in labels]
    labels.sort()

    statInputs.append(StatInput("__Participation__", values, labels))
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
