# La commande `extends` permet d'hériter d'un exercie existant.
# Ici, `basic/checkbox.pl` est un exercice modèle de question à choix multiple.
extends = /model/basic/checkbox.pl

# Un fichier .pl contient des définitions de clés, comme la clé `title` ci-dessous.
title = Multiples de 3

# La clé before est un script Python. 
# Celui-ci est exécuté après le chargement des clés du fichier PL et avant la construction de la page de l'exercice. 
# Toutes les clés du fichier PL (comme `title`) sont utilisables et modifiables dans le script 
# Le tag `#|python|` indique à l'éditeur d'activer la coloration syntaxique Python.
before == #|python|
# Dans le modèle `basic/checkbox.pl`, la variable `items` contient la liste des choix proposés.
items = sample(range(50, 100), 5) # La fonction `sample` est une fonction du module `random` (importée par défaut).
# La variable `indsol` contient la liste des indices des bonnes réponses.
indsol = []
for i, num in enumerate(items):
    if num % 3 == 0:
        indsol.append(i)
==

# La clé question contient l'énoncé de l'exercice.
question ==
Parmi les nombres suivants, lesquels sont des multiples de 3 ?
==