# La commande `extends` permet d'hériter d'un exercie existant.
# Ici, `basic/checkbox_rw.pl` est un exercice modèle de question à choix multiple
# où l'on fournit une liste de bonnes et de mauvaises réponses. L'exercice tire aléatoirement
# les choix proposés dans ces listes.
extends = /model/basic/checkbox_rw.pl

# Un fichier .pl contient des définitions de clés, comme la clé `title` ci-dessous.
title = Multiples de 3

# La clé before est un script Python. 
# Celui-ci est exécuté après le chargement des clés du fichier PL et avant la construction de la page de l'exercice. 
# Toutes les clés du fichier PL (comme `title`) sont utilisables et modifiables dans le script 
# Le tag `#|python|` indique à l'éditeur d'activer la coloration syntaxique Python.
before == #|python|
# Dans le modèle `basic/checkbox_rw.pl`, la variable `right` contient la liste des bonnes réponses
# et `wrong` la liste des mauvaises réponses.
right = [str(n) for n in range(50, 100) if n % 3 == 0]
wrong = [str(n) for n in range(50, 100) if n % 3 != 0]
==

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