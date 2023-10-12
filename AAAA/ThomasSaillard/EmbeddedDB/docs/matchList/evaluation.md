- Vous pouvez définir la manière dont sera évalué votre exercice à l'aide de la balise `evaluator`, vous aurez accès à un certains nombres de valeurs et aurez à charge de définir des valeurs sortantes.

- Entrées:

    - **`nombre_erreurs`** : `int`     -   Défaut:     `0`

        - Contient le nombre d'erreurs effectué par l'utilisateur

    - **`matchList.links`** : `list`     -   Défaut:     `[]`

        - Contient la liste des liens entrés par l'utilisateur, au format suivant:

        `{`

        `"source": string,` : identifiant de l'objet au format `source_X` où `X` est le nom d'une balise source

        `"target": string,` : identifiant de l'objet au format `target_X` où `X` est le nom d'une balise cible

        `}`


- Sortie:

    - **`score`** : `int`     -   Défaut:     `100`

        - Définis le score de l'étudiant, si le score est inférieur à 0, on considère que c'est une erreur et la réponse ne sera pas enregistrée.

    - **`feedback`** : `str`     -   Défaut:     <span class="success-state">Réponse enregistrée</span>

        - Définis le message affichée à l'étudiant après évaluation de son score.
