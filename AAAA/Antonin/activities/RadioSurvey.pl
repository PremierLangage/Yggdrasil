extends = /AAAA/Antonin/stats.pl

title= Dummy Title RadioSurvey

# Enonce / Tutoriel d'utilisation d'un RadioSurvey
text==#|markdown|
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

    Exemple:

    <code>
    
    items==

    Bien

    Passable

    Mal (faute de goût objectivement)

    42

    La couleur bleu

    ==

    </code>

<u>**Options:**</u>

{{options}}

<u>**Evaluation:**</u>

{{api}}

---

==

options==#|markdown|

[Options RadioSurvey.pl](https://pl-preprod.u-pem.fr/filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/activities/RadioSurvey.pl)

-  **`unique_choice`** : `Boolean`   -   Défaut: `False`

    - L'utilisateur doit-il choisir une réponse différente par question

    Exemple:

    - ```unique_choice = True```

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

api==#|markdown|
- Vous pouvez définir la manière dont sera évalué votre exercice à l'aide de la balise `evaluator`, vous aurez accès à un certains nombres de valeurs et aurez à charge de définir des valeurs sortantes.

- Entrées:

    - **`answer`** : `Dictionnaire`     -   Défaut:     `{}`

        - Contient les réponses de l'utilisateur, au format: `clé : valeur`, où:
        
            - **clé** est l'indice de la question *`(0 : nombre de question - 1)`*

            - **valeur** est le nom de la réponse selectionnée par l'utilisateur

    - **`questions`** : `list`     -   Défaut:     `[]`

        - Contient les questions de l'exercice, dans l'ordre
        
    - **`number_questions`** : `int`     -   Défaut:     `0`

        - Le nombre de question de l'exercice


- Sortie:

    - **`score`** : `int`     -   Défaut:     `100`

        - Définis le score de l'étudiant, si le score est inférieur à 0, on considère que c'est une erreur et la réponse ne sera pas enregistrée.

    - **`feedback`** : `str`     -   Défaut:     <span class="success-state">Réponse enregistrée</span>

        - Définis le message affichée à l'étudiant après évaluation de son score.

==

# Flags:
# L'utilisateur doit-il choisir une réponse différente par question
unique_choice = False

# Role : Traitement donnée, doit remplir la variable globale : data
# Format spécifié dans le fichier stats.pl
before==#|python|
import json, sys
from database_utils import get_session, Base, RadioResponse

questions = [v for q, v in globals().items() if q.startswith("question_")]
number_questions = len(questions)

radio = []
for i in range(len(questions)):
    tmp = RadioGroup(cid=str(i))
    tmp.question = questions[i]
    tmp.items = []
    for j, item in enumerate(items.splitlines()):        
        tmp.items.append({ "id": j+1, "content": item })
    globals()[str(i)] = tmp
    radio.append(vars(tmp))

if user__role == "teacher" and number_questions != 0:
    labels = items.splitlines()
    data = { q : [labels, []] for q in questions}
    answers_csv = f"username,firsname,lastname,email,{','.join(questions)}\\n"
    with get_session(table_class=RadioResponse, base=Base) as session:
        answers = session.query(RadioResponse.value).all()
    
    for answer in answers:
        for k, v in json.loads(str(answer[0])).items():
            data[questions[int(v)]][1].append(k)
    globals()["data"] = data
==

# Bloc html définissant le bloc utilisateur permettant de remplir des données pour les stats
# C'est la partie jouable de l'exercice
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

# Evaluation de la réponse de l'étudiant
evaluator_before == #|py|
from database_utils import get_session, Base, RadioResponse
import json
from utils import *

answer = {}
for i in range(len(radio)):
    answer[ i ] = response[str(i)]['items'][ int(response[str(i)]['selection'])-1 ]['content']

# Default Grade intilisation
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'
==

#default evaluator
evaluator==#|py| 
==

evaluator_after == #|py|
if (unique_choice != "False") and (len(answer) != int(number_questions)):
    score = -1
if int(score) >= 0:
    with get_session(table_class = RadioResponse, base=Base) as session:
        session.add(
            RadioResponse(
                student_id = user__id if user__id else session__id, 
                username    = user__username,
                firstname   = user__firstname,
                lastname    = user__lastname,
                email       = user__email,
                title       = title,
                text        = text,
                grade       = score,
                value       = json.dumps(answer)))
        session.commit()
else :
    feedback = '<span class="error-state">Vous ne pouvez pas sélectionner plusieurs fois la même option</span>'

grade = (score, feedback)
==