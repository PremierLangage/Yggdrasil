# Cette commande importe le modèle d'exercice pour les maths
# En particulier, elle importe la bibliothèque SymPy 
# et d'autres bibliothèques qu'on a développés autour de SymPy
extends = /model/mathinput.pl

# Titre de l'exercice
title = Multiplication de deux nombres complexes

# Création d'un champ de réponse de type MathInput (mise en forme TeX)
input =: MathInput
input.virtualKeyboards = complexes

# La clé before contient un script python qui est exécuté au lancement de l'exercice
# Comme on est dans le modèle "maths", il y a eu automatiquement un "from sympy import *" et un "import random as rd"
before ==
# I et la méthode expand, c'est du SymPy
z1 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
z2 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
sol = (z1 * z2).expand()
==

# Voilà le début de l'énoncé avec un principe de template (Jinja) pour insérer les variables produites dans le scripte before
text ==
On considère les nombres complexes $! z_1 = {{ z1.srepr }} !$ et $! z_2 = {{ z2.latex }} !$. Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

# Voilà la partie champ de réponse de l'énoncé. On place le "input" qu'on a créé et configuré. Toujours avec un principe de template.
form ==
{{ input|component }}
==

# La clé evaluator contient un script python qui est exécuté quand l'élève valide sa réponse
# Il faut définir dans ce script un score entre 0 et 100 (ou -1 pour un warning). Et éventuellement un feedback.
# Bon, ici, tout est caché dans la fonction eval_complex qui est dans une bibliothèque.
evaluator ==
score, _, feedback = eval_complex(input.value, sol, form="cartesian")
==
