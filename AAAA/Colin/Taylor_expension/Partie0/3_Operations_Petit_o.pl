# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o

extends = /model/math/expr.pl

title = Opérations sur les petits "o" : Produit 2.

before ==
var('x')
n = randint(2, 4)
m = randint(2,4)
sol = x**(n+m)
==

question ==
Simplifier l'expression ci-dessous (pour x qui tend vers $! 0 !$) en l'écrivant sous la forme
 $! o(x^n) !$ pour un $! n !$ bien choisi.
==

embed ==
# ) \quad [x \rightarrow 0]
==

prefix ==
$! o(x^{{n|latex}}) \times o(x^{{m|latex}}) = o( !$
==

solution ==
$$ o({{ sol|latex }})  .$$


En effet, il faut appliquer ici la règle suivante : Si $! n , m \in \mathbb N !$ alors $! o(x^n) \times o(x^m) = o(x^{n+m}) !$.
==

latexsettings.order = 'ilex'


