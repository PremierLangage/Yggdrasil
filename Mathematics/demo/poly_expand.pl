# Author: D. Doyen
# Tags: complex numbers

# Cette commande importe le modèle d'exercice pour les maths
# Ici c'est le modèle math avec un champ de réponse de type expression mathématique
# Ce modèle s'occupe de créer le champ de réponse (qui s'appelle input dans la suite).
# Et il fait un certain nombre d'importations et de paramétrages spécifiques aux maths.
extends = /model/mathinput.pl

# Titre de l'exercice
title = Multiplication de deux nombres complexes

# La clé before contient un script python qui est exécuté au lancement de l'exercice
# Comme on est dans le modèle "mathinput", il y a automatiquement un "from sympy import *" et un "import random as rd"
before ==
var('x') # crée le symbole x
P = rd.randint(-5, 5) + rd.randint(-5, 5)*x
Q = rd.randint(-5, 5) + rd.randint(-5, 5)*x
exprpoly = P*Q
sol = (P * Q).expand()
==

# Voilà le début de l'énoncé avec un principe de template (Jinja) pour insérer les variables produites dans le script before.
# Le délimiteur pour le latex inline c'est $!...!$ ($..$ ça rentrait en conflit avec qqch)
# On a un filtre latex qui convertit automatiquement un objet Sympy en latex.

text ==
Développer $${{ expr_poly|latex }}.$$
==

evaluator ==
score, error = eval_poly(input.value, sol, var="x", form="expanded")
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==





