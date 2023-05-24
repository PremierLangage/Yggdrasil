Pour ce faire vous devez définir les variables globales suivantes:

- **`data`** : dictionnaire contenant les données au format : 

    - **key   :** str : nom graphe

    - **value :** list : Couple contenant les labels (valeurs possibles) et les values (valeurs)
        
        - **labels :** list : valeurs possibles (seront représentées sur l'histogramme)

        - **values :** list : valeurs à afficher dans l'histogramme

    Exemple: 
    
    - `data` % {'test1': [[0,1,2,3], [1,2,2,3,3,3]], "test": [["rien", "coucou", "test", "a"], ["coucou", "test", "a", "a"]]}

- **`answer_csv`** : string représentant le format d'une ligne du csv

    Exemple: 
    
    - `answer_csv=`"username,firsname,lastname,email,title,statement,grade\\n"

- **`formstudent`** : block html au format string représentant la partie jouable par un utilisateur lambda

    Exemple: 
    
    `formstudent`==#|html|

    <h2> Hello World ! </h2>
    
    ==