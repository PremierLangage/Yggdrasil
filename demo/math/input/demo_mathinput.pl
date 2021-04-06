extends = /model/math/input.pl

title = Démonstration math/expr

before ==
var('x')
sol = ln(Abs(x))
==

text ==
Entrer l'expression $! {{ sol|latex}} !$.
==

feedback ==
Code LaTeX : {{ codelatex }}

Objet Sympy : {{ strsympy }}

Représentation de l'objet Sympy : {{ reprsympy }}
==
