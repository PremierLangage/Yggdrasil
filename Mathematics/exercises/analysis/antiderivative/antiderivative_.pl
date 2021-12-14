extends = /model/math/expr.pl

text ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{f_tex}} .$$
==

evaluator==
var('x')
score,_,feedback=ans_antiderivative(input.value,sol,x)
==

solution ==
Les primitives de cette fonction sont les fonctions de la forme $$ x \mapsto {{sol_tex}} + k $$
où $! k !$ est une constante réelle.
==


