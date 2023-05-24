Pour ce faire vous devez définir les variables globales suivantes:

- **`data`** : dictionnaire contenant les données au format : 

    - **key   :** str : nom graphe

    - **value :** list : Couple contenant les labels (valeurs possibles) et les values (valeurs)
        
        - **labels :** list : valeurs possibles (seront représentées sur l'histogramme)

        - **values :** list : valeurs à afficher dans l'histogramme

    Exemple: 
    
    - `data` % {'test1': [[0,1,2,3], [1,2,2,3,3,3]], "test": [["rien", "coucou", "test", "a"], ["coucou", "test", "a", "a"]]}

- **`answers_csv`** : string représentant le texte à télécharger au format csv

    Exemple: 
    
    - `answers_csv=`"username,firsname,lastname,email,title,statement,grade\\n"

- **`formstudent`** : block html au format string représentant la partie jouable par un utilisateur lambda

    Exemple: 
    
    `formstudent`==#|html|

    <h2> Hello World ! </h2>
    
    ==