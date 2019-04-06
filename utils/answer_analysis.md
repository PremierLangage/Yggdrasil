# Fonctions d'analyse des réponses

Dans le modèle d'exercice `mathexpr`, la réponse de l'élève est une chaîne de caractères écrite en langage Latex et représentant une expression mathématique. Pour analyser une telle réponse une stratégie consiste à :
- convertir la chaîne en un objet de type `sympy` (Expr, Set, Interval, Poly, Matrix, etc.)
- effectuer un certain nombre de tests sur cet objet de type `sympy` (égalité avec la solution, forme, etc.)

## Nombres

`ans_frac`

~~~
>>> sol=Rational(3,2)
>>> ans_frac("3/2",sol)
(100, 0, '')

>>> ans_frac("1/2",sol)
(0, 1, '')

>>> ans_frac("6/4",sol)
(0, 2, "Votre réponse n'est pas une fraction irréductible.")

>>> ans_frac("x",sol)
(-1, 3, "Votre réponse n'est pas une fraction d'entiers ou un entier.")
~~~
