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
