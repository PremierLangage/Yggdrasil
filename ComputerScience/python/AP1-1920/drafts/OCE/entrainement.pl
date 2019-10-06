
# author = Olivier Champalle
# Utilisation du code du composant "Code editor"

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl
extends=/ComputerScience/python/AP1-1920/templates/looptemplate.pl

taboo=while
needed=for

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

soluce==
a=input("Entrez un nombre : ")
for i in range(12):
    print(i+1,a)
    a = a * 3
==

plsoluce==
classique | 12 
==










