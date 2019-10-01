
# author = Olivier Champalle
# Utilisation du code du composant "Code editor"

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==

before==
==

title = Suite géométrique de raison 3

text==
En utilisant une boucle de type "for...in...range", écrire un programme qui affiche une suite de 12 nombres dont chaque terme soit 
égal au triple du terme précédent.
==

form==
{{ editor|component }}
==

evaluator==
grade = (100, f"student code:\n{editor.code}")
==


