
# author = Olivier Champalle
# Utilisation du code du composant "Code editor"

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==

title = Suite géométrique de raison 3

text==
En utilisant une boucle de type "for...in...range", écrire un programme qui affiche une suite de 12 nombres dont chaque terme soit 
égal au triple du terme précédent.
==

# formulaire de saisie du code 
form==
{{ editor|component }}
==

evaluator==
# Récupération du code pour vérifier que le while n'est pas utilisé
# si utilisé : 
# retour_eleve = "Vous ne pouvez pas utiliser de boucle while"
grade = (0, f"student code:\n{retour_eleve}")
exec(editor.code)

grade = (100, f"student code:\n{a}")
==


