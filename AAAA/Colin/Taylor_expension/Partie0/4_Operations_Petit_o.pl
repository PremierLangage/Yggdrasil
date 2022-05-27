# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o

extends = /model/math/expr.pl

title = Opérations sur les petits "o" : Multiplication par une constante.

before ==
var('x')
n = randint(2, 6)
m = randint(1,20)
sol = x**n
==

question ==
Simplifier l'expression ci-dessous (pour x qui tend vers $! 0 !$) en l'écrivant sous la forme
 $! o(x^n) !$ pour un $! n !$ bien choisi.
==

embed ==
# ) \quad [x \rightarrow 0]
==

prefix ==
$! {{m|latex}} \times o(x^{{n|latex}}) = o( !$
==

solution ==
$! o({{ sol|latex }})  .$$


En effet, il faut appliquer ici la règle suivante : Si $! C \in \mathbb R !$ et $!n \in \mathbb N!$ alors $!C \times o(x^n) = o(x^{n}) !$.
==

latexsettings.order = 'ilex'


