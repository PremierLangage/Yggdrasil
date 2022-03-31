extends = /model/math/expr.pl

before ==
var('x')
f = ln(x)
sol = 0
==

question ==
Calculer la dérivée de la fonction 
$${{ f|latex }}$$
==

latexsettings.ln_notation = True