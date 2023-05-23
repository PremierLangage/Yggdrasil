extends = /AAAA/Antonin/stats.pl

title= Dummy Title CodeEditorSurvey

text==#|markdown|
Ici vous pouvez définir une activité de **CodeEditor** incluant le module de Statistique :

    - exercice codeEditor : Rédaction et execution de code informatique dans un IDE adapté.

    - affichage de graphe (histogramme) représentant les données pour l'enseignant

    - récupération des entrées au format `csv`

---

**Manuel Utilisateur:**

Pour ce faire vous devez définir les variables globales suivantes:

- Les spécificités de l'éditeur de code:

    - **`editor.theme`**: Définit le thème pour l'affichage de l'IDE

    > Default : `dark`

    Exemple:

    > ```editor.theme = white```

    - **`editor.language`**: Définit la langue utilisée pour la coloration syntaxique de l'IDE

    > Default : `python`

    Exemple:

    > ```editor.language = c```

    - **`editor.code`**: Définit le code initialement présent dans l'IDE

    > Default :
    
    `editor.code ==`

    `# write your code here`

    `==`

    Exemple:

    > ```editor.language = c```

<u>**Options:**</u>

{{options}}

<u>**Evaluation**</u>

{{api}}

---
==

options==#|python|

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

    - **`editor.code`** : `str`     -   Défaut:     `# write your code here`

    - Contient le code rentré par l'étudiant

- Sortie:

    - **`score`** : `int`     -   Défaut:     `100`

    - Définis le score de l'étudiant, si le score est inférieur à 0, on considère que c'est une erreur et la réponse ne sera pas enregistrée.

    - **`feedback`** : `str`     -   Défaut:     <span class="success-state">Réponse enregistrée</span>

    - Définis le message affichée à l'étudiant après évaluation de son score.

==

editor =: CodeEditor
editor.theme = white
editor.language = python
editor.code ==
# write your code here
==


before==#|python|
globals()["data"] = {}
==

formstudent==#|html|
{{ editor|component }}
==

evaluator_before==#|py|
from database_utils import get_session, Base, CodeEditorResponse

# Default Grade intilisation
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'
==

# default evaluator dummy
evaluator==#|py|
==

evaluator_after==#|py|
if editor.codes[0]['defaultCode'] == editor.code:
    feedback = '<span class="error-state">Vous n\'avez rien saisis, annulation de l\'envois de la réponse</span>'
    score = -1
else:
    with get_session(table_class = CodeEditorResponse, base=Base) as session:
        session.add(
            CodeEditorResponse(
                student_id  = user__id if user__id else session__id, 
                username    = user__username,
                firstname   = user__firstname,
                lastname    = user__lastname,
                email       = user__email,
                title       = title,
                text        = text,
                grade       = score,
                score       = score
            )
        )
        session.commit()

grade = (score, feedback)
==