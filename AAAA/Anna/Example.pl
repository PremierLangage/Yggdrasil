@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/none.py [builder.py]

inputbox =: Input
inputbox.type = multiline

general_feedback = " Your name has been successfully saved. " 

title = Saving entries
text  = PLEASE WRITE YOUR NAME
form  = {{ inputbox|component }}



evaluator==
# TODO sauvegarder la réponse de l'élève dans la session 
grade = (100, general_feedback)
==

