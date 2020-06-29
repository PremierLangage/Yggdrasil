# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]
extends = /gift/templates/qselectset.pl

general_feedback = " Merci pour votre réponse." 

title = Evaluation question

text  ==
(mettre à vide après)  
Enoncé de la question  
Réponse de l'élève  
Question(s) à choix multiples (1 seule réponse sélectionnable)  
==

choices==
=Copie blanche
=Insuffisant
=Passable
=Bien
=Très bien
==







