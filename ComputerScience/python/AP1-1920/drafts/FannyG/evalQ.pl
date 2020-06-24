# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

inputbox =: Input
inputbox.type = text

general_feedback = " Merci pour votre réponse." 

title = Evalutation question
text  ==
Enonce de la question  
Réponse de l'élève
==
form  = {{ inputbox|component }}

before= 

evaluator==
grade = (100, general_feedback)
==

