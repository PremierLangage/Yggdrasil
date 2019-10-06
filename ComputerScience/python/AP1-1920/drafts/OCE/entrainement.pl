
# author = Olivier Champalle
# Utilisation du code du composant "Code editor"

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl
extends=/ComputerScience/python/AP1-1920/templates/looptemplate.pl

difficulty=2
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

evaluator==
import re
# Récupération du code pour vérifier que le while n'est pas utilisé
# regex sur while (il faut aussi chercher une référence à un commentaire au cas où
regex = re.search("while", editor.code)
if regex != None:
    retour_eleve="Référence à la boucle while présente dans votre code"
    grade = (0, f"\n{retour_eleve}")
else:
    # récupérer les variables locales (le input de l'utilisateur)
    # tester editor.code avec le input
    exec(editor.code)
    # tester la solution avec le même input
    # comparer les deux résultats
    Si similaire
    retour_eleve="Pas de boucle while c'est OK"
    grade = (100, f"\n{retour_eleve}")

==






