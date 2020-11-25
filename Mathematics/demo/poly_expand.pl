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
# crée le symbole x
var('x')
# crée des polynômes aléatoires avec des paramètres donnés (degré, 
# nombre de coeff, borne sur les coeff, indéterminée)
# c'est une fonction qu'on a créé dans une bibli randsympy
#P = rand_int_poly(2, 2, 5, x)
#Q = rand_int_poly(3, 2, 5, x)
#expr = P * Q
#sol = (expr).expand()
==

# Voilà le début de l'énoncé avec un principe de template (Jinja) pour insérer les variables produites dans le script before.
# Le délimiteur pour le latex inline c'est $!...!$ ($..$ ça rentrait en conflit avec qqch)
# On a un filtre latex qui convertit automatiquement un objet Sympy en latex.

text ==
On considère les nombres complexes 
==

# On choisit le type de clavier virtuel
input.virtualKeyboards = complex

# La clé evaluator contient un script python qui est exécuté quand l'élève valide sa réponse
# Il faut définir dans ce script un score entre 0 et 100 (ou -1 pour un warning). Et éventuellement un feedback.
# Bon, ici, tout est caché dans la fonction eval_complex qui est dans une bibliothèque.
# Cette fonction prend en paramètres : la valeur rentrée par l'élève input.value (une chaîne latex),
# la solution attendue (un objet sympy) et des options.
# Elle renvoie un score et un code d'erreur
# On a des messages prédéfinis dans le dictionnaire "message" pour transformer le code erreur en message

evaluator ==
score, error = eval_complex(input.value, sol, form="cartesian")
feedback = message[error]
==

# Ca c'est la correction finale.
solution ==
La solution est $! {{ sol|latex}} !$.
==



