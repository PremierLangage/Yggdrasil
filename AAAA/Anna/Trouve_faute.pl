extends = /Languages/French/Orthographe/Trouve_faute_template.pl

title==
Trouve Fautes    
==

text ==
Corriger les fautes d'orthographe dans les phrases suivantes ou cliquer sur correct si vous 
trouvez qu'elles sont correctes
==

@ /AAAA/Anna/Orthographe.txt 

file_list==
["Orthographe.txt"]
==

consecutive_to_validate = 4

recall_rule = True

doc==
On importe le fichier .txt où se trouvent la règle en question, sa description et les exercices.
On met le nom du/des fichiers dans la balise file_liste entre crochet []

Constitution du fichier .txt :
->règle : Enoncé de la règle
-> description : description de la règle
-> Pour chaque phrase à corriger, on définit : 
    - mauvais : la phrase avec les fautes   
    - bon : la phrase correcte 
    - explication : explication détaillée de la correction

La balise consecutive_to_validate permet de définir le nombre de réponses justes consécutives autorisées
pour valider l'exercice. 

La balise recall_rule permet de définir si on rappelle la règle en début d'exercice (True) ou pas (False) 

==
