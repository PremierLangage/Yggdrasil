
doc==
# Pour que ce grader fonctionne il faut 

Des balises **front** and **back** qui sont utilisée pour fabriquer un script python en utilisant le code de l'élève 
ou le code de la balsie soluce. 

En suite des balises **plsoluceN**
qui contienne des lignes de la forme 

    plsoluce0==
    Nom du test | une ligne d'entrée 
    le caractère '|‘ séparant les deux parties (les espaces ne sont pas éliminés en debut ni en fin)
    ==


# en suite vous devez fournir une balise soluce 
# contenant une solution de l'exercice 
# dont les résultats seront comparés 
# au résultats de l'élève

pour avoir une entrée multi ligne 

    mplsoluce0==
    Nom du test 
    entrée
    sur 
    plusieurs 
    lignes
    ==


==

# TODO rapatrier les fichiers suivants
@ utils/prosolucegrader.py          [grader.py] # le as de python import toto as titi
@ utils/classsoluce.py
@ /utils/sandboxio.py

@ /builder/before.py [builder.py]

@ utils/feedback2.py
@ utils/template.html


# une interface standard d'exercice avec un editeur pour la réponse
form=@ /python/form/editorform.html

settings.allow_reroll=1









