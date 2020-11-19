@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/none.py [builder.py]

inputbox =: Input
inputbox.type = multiline

general_feedback = " Thank you ! Your answer has been successfully saved. " 

title = Saving entries
text  = Etes vous apprenti ou suivez vous le parcours scolaire initial ? Apprenti / Initial
form  = {{ inputbox|component }}

evaluator==
# TODO sauvegarder la réponse de l'élève dans la session 
grade = (100, general_feedback)
==

doc ==
Ce style d'exo permet de sauvegarder les informations entrées par l'utilisateur
dans le grader. Il n'évalue ni ne renvoie pas une note. Adapté aux sondages
par exemple.
==

