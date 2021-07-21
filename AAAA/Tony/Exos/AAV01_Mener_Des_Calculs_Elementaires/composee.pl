extends = /model/math/expr.pl

title = Démonstration math/expr

before ==
var('x')
f = x
sol = f
==

question ==
Soit f :  $! {{ x\mapsto f|latex}} !$.
Entrer l'expression  $! {{ sol|latex}} !$.
==

inputblock ==
{{ mathinput("math") }}
{{ mathinput("math2") }}
==

mathinputid % ["math", "math2"]