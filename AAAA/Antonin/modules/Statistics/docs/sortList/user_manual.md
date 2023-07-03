Pour ce faire vous devez définir les variables globales suivantes:

- Un ensemble de question au format suivant : **`question_X`**:

    Où X est un identifiant se devant d'être unique et n'ayant aucune incidence dans la suite du code.

    Exemple:

    > ```question_1 = Que pensez-vous de ce tutoriel ?```

    > ```question_plus_pertinente = Est-ce que vous aussi vous avez du mal à finir vos...```

- Une liste de réponses possibles dans une variable **`items_X`**:

    Où une réponse équivaut à une ligne, et l'ensemble de réponse est définis pour une question ayant été définis dans l'exercice avec l'identifiant unique X

    Si une liste de réponse n'est rattachée à aucune question, elle sera perdue

    Si une question n'a aucune réponse attachée, le comportement sera incomplet.

    Exemple:

    <code>
    
    items_1==

    Bien

    Passable

    Mal (faute de goût objectivement)

    42

    La couleur bleu

    ==

    </code>
