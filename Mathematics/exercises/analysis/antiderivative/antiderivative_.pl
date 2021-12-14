extends = /model/math/expr.pl

question ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{ f|latex }} .$$
==

evaluator==
var('x')
score,_,feedback=ans_antiderivative(input.value,sol,x)
==

solution ==
Les primitives de cette fonction sont les fonctions de la forme $$ x \mapsto {{ sol|tex }} + k $$
où $! k !$ est une constante réelle.
==


