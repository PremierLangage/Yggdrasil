

doc==
# Pour que ce grader fonctionne il faut qu'il y ai une balise 
# qui contienne des lignes de la forme 
    plsoluce==
    Nom du test | une ligne d'entrée 
    le caractère '|‘ séparant les deux partie (les espaces ne sont pas éliminés en debut ni en fin)
    ==

==

@ soluceevaluator.py          [grader.py] # le as de python import toto as titi
@ gradesoluce.py
@ /utils/sandboxio.py

@ /builder/none.py [builder.py]

@ feedback2.py
@ template.html


# une interface standard d'exercice avec un editeur pour la réponse
form=@ /python/form/editorform.html

settings.allow_reroll=1



