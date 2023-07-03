- Vous pouvez définir la manière dont sera évalué votre exercice à l'aide de la balise `evaluator`, vous aurez accès à un certains nombres de valeurs et aurez à charge de définir des valeurs sortantes.

- Entrées:

    - **get_question( X : str ) -> Question** : Une méthode retournant un objet **Question** à partir d'un identifiant unique `X` définit dans les champs `question_X` et `items_X`

    - **Objet Question**:

        Pour un objet Question `q` obtenu avec la ligne `q = get_question("X")`

        - **`q.name`** : obtenir le nom de la question

        - **`q.items`** : obtenir les réponses possibles à la question

        - **`q.answers`** : obtenir les réponses de l'utilisateur à la question


    - **`questions`** : `list`     -   Défaut:     `[]`

        - Contient les identifiants des questions de l'exercice, dans l'ordre

    - **`questions_name`** : `list`     -   Défaut:     `[]`

        - Contient les noms des questions de l'exercice, dans l'ordre
        
    - **`number_questions`** : `int`     -   Défaut:     `0`

        - Le nombre de question de l'exercice


- Sortie:

    - **`score`** : `int`     -   Défaut:     `100`

        - Définis le score de l'étudiant, si le score est inférieur à 0, on considère que c'est une erreur et la réponse ne sera pas enregistrée.

    - **`feedback`** : `str`     -   Défaut:     <span class="success-state">Réponse enregistrée</span>

        - Définis le message affichée à l'étudiant après évaluation de son score.
