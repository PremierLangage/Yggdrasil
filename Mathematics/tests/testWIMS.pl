extends = /model/mathinput.pl
title = Un pré
author = Sophie Lemaire
input =: MathInput


before ==
L = 10 * rd.randint(1,10)
l = 10 * rd.randint(1,10)
per = 2 * (L + l)
x = sp.Symbol('x')
P = sp.sympify("x + x**2 + 3*x", evaluate=False)
test = is_poly_ratsimp(P, x)
==

text ==
Donner le périmètre d'un pré rectangulaire {{test}} de longueur {{L}} m et de largeur {{l}} m.
==



form ==
périmètre (en m)
{{input|component}}
==

evaluator ==
grade = eval_expr(input.value, per)
==



