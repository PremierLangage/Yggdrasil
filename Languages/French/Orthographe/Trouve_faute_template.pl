# ***************************************************************************
# PATRON D'EXERCICE TROUVE FAUTE 
#
# Des phrases arrivent aléatoirement devant l'apprenant. Ce dernier doit
# localiser la faute d'orthographe ou alors cliquer sur un bouton pour 
# dire qu'il pense que la phrase est correcte.
#
# Pour chaque règle d'orthographe, l'apprenant doit valider son apprentissage
# en appliquant la règle correctement 5 fois d'affiler (changer la valeur de 
# la variable). 
#

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title=Définissez un titre S.V.P.
author=Nicolas Borie

files==
["ses_ou_ces.txt"]
==

nb_good_to_validate=-1
consecutive_to_validate=5



before==#|python|

==



evaluator==#|python|

==




