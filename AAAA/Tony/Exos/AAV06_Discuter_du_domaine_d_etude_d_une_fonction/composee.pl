extends = /model/math/expr.pl

title = Savoir calculer une fonction composée (fonction de \R -> \R)

before ==
var('x')
f =  choice([exp(x),ln(x),sin(x),cos(x),sqrt(x+1),tan(x)]) 
g = choice([x**2+1,exp(x),ln(x),sin(x),cos(x),sqrt(x),x**3+2*x**2-5,x**4+x-12])
sol = f.subs(x,g)
==

question ==
Soit f :  $! x \mapsto {{ f|latex}} !$.
Entrer l'expression  $! f({{ g|latex}}) !$.
==
