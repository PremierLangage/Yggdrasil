extends = /model/math/expr.pl

title = Valeurs remarquables de sinus et cosinus

before ==
x = choice([pi/6, pi/4, pi/3, 3*pi/4, 2*pi/3, 5*pi/6])
f = choice([sin, cos]) 
sol = f(x)
==

question ==
Quelle est la valeur de la fonction $! {{ f|latex }} !$ en $!\displaystyle {{ x|latex }} !$ ?
==

unauthorized_func = ['sin', 'cos']