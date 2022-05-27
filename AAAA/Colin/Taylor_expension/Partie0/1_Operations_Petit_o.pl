# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o

extends = /model/math/expr.pl

title = Opérations sur les petits "o" : Somme.

before ==
var('x')
n = randint(1, 4)
m = randint(4,6)
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
$! o(x^{{n|latex}}) + o(x^{{m|latex}}) = o( !$
==

solution ==
$$ o(x^{{n|latex}}) + o(x^{{m|latex}}) = o({{ sol|latex }})  .$$

En effet, il faut appliquer ici la règle suivante : Si $! n \leq m!$ alors $! o(x^n) + o(x^m) = o(x^n) !$.
==

latexsettings.order = 'ilex'

