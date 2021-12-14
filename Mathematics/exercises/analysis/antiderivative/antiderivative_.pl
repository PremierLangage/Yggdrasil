extends = /model/math/expr.pl

question ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{ f|latex }} .$$
==

solution ==
Les primitives de cette fonction sont les fonctions de la forme $$ x \mapsto {{ sol|latex }} + k $$
où $! k !$ est une constante réelle.
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.

