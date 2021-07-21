extends = /model/math/expr.pl

title = Démonstration math/expr

before ==
var('x')
f = x
sol = f.subs(x,2x)
==

question ==
Soit f : 
Entrer l'expression  $! {{ sol|latex}} !$.
==

inputblock ==
{{ mathinput("math") }}
{{ mathinput("math2") }}
==

mathinputid % ["math", "math2"]