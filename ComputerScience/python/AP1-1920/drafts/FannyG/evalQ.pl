# author=Fanny Garnevault

@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

inputbox =: Input
inputbox.type = text

general_feedback = " Merci pour votre réponse." 

title = Evalutation question
text  = PLEASE OVERRIDE THE TEXT OF THE EXERCISE
form  = {{ inputbox|component }}

before= 

evaluator==
grade = (100, general_feedback)
==

