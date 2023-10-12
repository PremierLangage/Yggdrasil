Pour ce faire vous devez définir les variables globales suivantes:

- Une liste de réponses possibles dans une variable **`matches`**:

    Où réponse est formatté dans le schéma suivant : `source,cible1,cible2,...ciblen`

    Vous pouvez définir les cibles données pour une source, en séparant chaque élément par une virgule

    Les cibles et sources seront créés dynamiquement, puis mélangées respectivements.

    Exemple:

    <code>
    
    matches ==

    3*3,9

    nombres pairs,2,4,8,10

    puissances de 2, 2,4,8

    ==

    </code>
