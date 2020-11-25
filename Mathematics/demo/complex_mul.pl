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
# I et la méthode expand, c'est du SymPy
z1 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
z2 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
sol = (z1 * z2).expand()
==

# Voilà le début de l'énoncé avec un principe de template (Jinja) pour insérer les variables produites dans le script before.
# Le délimiteur pour le latex inline c'est $!...!$ ($..$ ça rentrait en conflit avec qqch)
# On a un filtre latex qui convertit automatiquement un objet Sympy en latex.

text ==
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2= {{ z2|latex }} !$. Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

# On choisit le type de clavier virtuel
input.virtualKeyboards = complex

# La clé evaluator contient un script python qui est exécuté quand l'élève valide sa réponse
# Il faut définir dans ce script un score entre 0 et 100 (ou -1 pour un warning). Et éventuellement un feedback.
evaluator ==
# Bon, ici, tout est caché dans la fonction eval_complex qui est dans une bibliothèque.
# Cette fonction prend en paramètres : la valeur rentrée par l'élève input.value (une chaîne latex),
# la solution attendue (un objet sympy) et des options.
# Elle renvoie un score et un code d'erreur
score, error = eval_complex(input.value, sol, form="cartesian")
# On a des messages prédéfinis dans le dictionnaire "message" pour transformer le code erreur en message
feedback = message[error]
==

# Ca c'est la correction finale.
solution ==
La solution est $! {{ sol|latex}} !$.
==



