extends = /model/math/expr.pl

title = Démonstration math/expr

before ==
var('x')
sol = x+1
==

question ==
Entrer l'expression $! {{ sol|latex}} !$.
==

inputblock ==
{{ mathinput("math") }}
{{ mathinput("math2") }}
==

mathinputid % ["math", "math2"]