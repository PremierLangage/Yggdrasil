extends = /model/math/expr.pl

#Voir comment mettre plusieurs réponses afin de demander le domaine de définition de la composée.
title = Savoir calculer une fonction composée (fonction de \R -> \R)

before ==
var('x')
f =  choice([exp(x),ln(x),sin(x),cos(x),sqrt(x+1),tan(x)]) 
g = choice([x**2,exp(x),ln(x),sin(x),cos(x),sqrt(x),2*x+1])
sol = f.subs(x,g)
==

question ==
Soient f :  $! x \mapsto {{ f|latex}} !$ et g :  $! x \mapsto {{ g|latex}} !$.
Donner l'expression de   $! f\circ g(x) !$.
==
