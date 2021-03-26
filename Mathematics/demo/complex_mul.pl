extends = /model/mathquill.pl

title = Multiplication de deux nombres complexes

before ==
z1 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
z2 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
sol = (z1 * z2).expand()
==

text ==
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2= {{ z2|latex }} !$. Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

evaluator ==
score, error = eval_complex(answers['math'], sol, form="cartesian")
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==
