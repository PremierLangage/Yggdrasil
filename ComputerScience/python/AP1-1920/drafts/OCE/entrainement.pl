
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
import re
# Récupération du code pour vérifier que le while n'est pas utilisé
# regex sur while
regex = re.search("while", editor.code)
if regex != None:
    retour_eleve="Référence à la boucle while présente dans votre code"
    grade = (0, f"\n{retour_eleve}")
else:
    # retour_eleve="Pas de boucle while c'est OK"
    exec(editor.code)
    grade = (100, f"\n{retour_eleve}")

==





