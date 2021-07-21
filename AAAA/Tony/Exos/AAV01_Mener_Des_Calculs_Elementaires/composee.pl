extends = /model/math/expr.pl

title = Démonstration math/expr

before ==
var('x')
f = x**2
sol = f.subs(x,2x+1)
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