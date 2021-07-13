

doc==
# Pour que ce grader fonctionne il faut qu'il y ai une balise plsoluce
# qui contienne des lignes de la forme 
    plsoluce==
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


@ soluceevaluator.py          [grader.py] # le as de python import toto as titi
@ gradesoluce.py
@ /utils/sandboxio.py

@ /builder/before.py [builder.py]

@ feedback2.py
@ template.html


# une interface standard d'exercice avec un editeur pour la réponse
form=@ /python/form/editorform.html

settings.allow_reroll=1




