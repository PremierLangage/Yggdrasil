- Vous pouvez définir la manière dont sera évalué votre exercice à l'aide de la balise `evaluator`, vous aurez accès à un certains nombres de valeurs et aurez à charge de définir des valeurs sortantes.

- Entrées:

    - **`answer`** : `Dictionnaire`     -   Défaut:     `{}`

        - Contient les réponses de l'utilisateur, au format: `clé : valeur`, où:
        
            - **clé** est l'identifiant de la question

            - **valeur** est un couple contenant:

                - **question** : le nom de la question

                - **items** : les réponses selectionnés à la question

    - **`questions`** : `list`     -   Défaut:     `[]`

        - Contient les identifiants des questions de l'exercice, dans l'ordre
        
    - **`number_questions`** : `int`     -   Défaut:     `0`

        - Le nombre de question de l'exercice


- Sortie:

    - **`score`** : `int`     -   Défaut:     `100`

        - Définis le score de l'étudiant, si le score est inférieur à 0, on considère que c'est une erreur et la réponse ne sera pas enregistrée.

    - **`feedback`** : `str`     -   Défaut:     <span class="success-state">Réponse enregistrée</span>

        - Définis le message affichée à l'étudiant après évaluation de son score.
