extends = /AAAA/Antonin/activities/RadioSurvey.pl

title = Exercice d'exemple | RadioGroup

text==#|markdown|
### Ceci est un exemple d'exercice visant à montrer l'utilisation de l'activité PL [`RadioSurvey.pl`](/AAAA/Antonin/activities/RadioSurvey.pl) dont voici la documentation:

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

**Options:**

-  **`unique_answers`** : `Boolean`   -   Défaut: `False`

    > L'utilisateur peut-il choisir la même réponse pour des questions différentes

    Exemple:

    > ```unique_answers = True```
    
---

==

question_1 = Que pensez vous de cet exercice?
question_2 = Et globalement de PL
question_3 = Êtes vous satisfait de l'affichage des graphes


items==
Très satisfaisant
Satisfaisant
Moyennement satisfaisant
Mediocre
La couleur bleu
==