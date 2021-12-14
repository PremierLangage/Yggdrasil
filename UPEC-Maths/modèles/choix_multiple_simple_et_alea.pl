# La commande `extends` permet d'hériter d'un exercie existant.
# Ici, `basic/checkbox_rw.pl` est un exercice modèle de question à choix multiple
# où l'on fournit une liste de bonnes et de mauvaises réponses. L'exercice tire aléatoirement
# les choix proposés dans ces listes.
extends = /model/basic/checkbox_rw.pl

# Un fichier .pl contient des définitions de clés, comme la clé `title` ci-dessous.
title = Multiples de 3

# La clé `right` contient la liste des bonnes réponses.
right ==
3
6
9
12
15
18
==

# La clé `wrong` contient la liste des mauvaises réponses.
# Cette liste peut être saisie de plusieurs façons.
wrong = [4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19]


# La clé question contient l'énoncé de l'exercice.
question ==
Parmi les nombres suivants, lesquels sont des multiples de 3 ?
==

# La clé `nbitems` contient le nombre de propositions à tirer.
nbitems = 5
# La clé `minright` contient le nombre minimal de bonnes réponses à tirer.
minright = 1
# La clé `maxright` contient le nombre maximal de bonnes réponses à tirer.
maxright = 4
