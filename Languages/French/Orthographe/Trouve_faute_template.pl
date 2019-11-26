# ***************************************************************************
#                     PATRON D'EXERCICE TROUVE FAUTE 
#
# Des phrases arrivent aléatoirement devant l'apprenant. Ce dernier doit
# localiser la faute d'orthographe ou alors cliquer sur un bouton pour 
# dire qu'il pense que la phrase est correcte.
#
# Pour chaque règle d'orthographe, l'apprenant doit valider son apprentissage
# en appliquant la règle correctement 5 fois d'affiler (changer la valeur de 
# la variable consecutive_to_validate). Si, au contraire, vous préférez que
# valide un certain nombre de bonne réponse (pas forcément consécutives), il
# vous faut alors changer la valeur de nb_good_to_validate pour un objectif
# entier et positif.
#
# Pour toute suggestion et/ou correction, contacter un informaticien ou
# l'auteur à son adresse mail : nicolas dot borie at u-pem dot fr
# ***************************************************************************

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





