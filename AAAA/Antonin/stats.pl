@database_utils.py
@graph_utils.py
@stats_utils.py


@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ statbefore.py

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

    > **key   :** str : nom graphe

    > **value :** list : Couple contenant les labels (valeurs possibles) et les values (valeurs)
        
        > **labels :** list : valeurs possibles (seront représentées sur l'histogramme)

        > **values :** list : valeurs à afficher dans l'histogramme

    Exemple: 
    
    > ```data % {"test1": [[0,1,2,3], [1,2,2,3,3,3]], "test": [["rien", "coucou", "test", "a"], ["coucou", "test", "a", "a"]]}```

- **`answer_csv`** : string représentant le format d'une ligne du csv


    Exemple: 
    
    > ```answer_csv="username,firsname,lastname,email,title,statement,grade\\n"```

- **`formstudent`** : block html au format string représentant la partie jouable par un utilisateur lambda

    Exemple: 
    
    `formstudent==#|html|`

    `<h2> Hello World ! </h2>`
    
    `==`

---

==

############################################

data % {"test1": [[0,1,2,3], [1,2,2,3,3,3]], "test":  [["rien", "coucou", "test", "a"], ["coucou", "test", "a", "a"]]}
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
from database_utils import get_session, Base, init, Response
from stats_utils import Stat, StatInput

init(f"la_database_{activity__id}")

with get_session(table_class= Response, base=Base) as session:
    HAS_ANSWERED = (session.query(Response).filter(Response.student_id == user__id).first()) != None
==

before==#|python|
# Nothing, work is done in implementations
# needs to be overwriten
==

before_graph==#|python|
# GRAPH GENERATION
statInputs = [StatInput(title, values, labels) for title, (labels, values) in data.items()]
stat = Stat(statInputs)

graphContent = stat.get_graph_as_html(containsScript=True)
==

form==#|html|
{% if user__role == "teacher" %}
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
