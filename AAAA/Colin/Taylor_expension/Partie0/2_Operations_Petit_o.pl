# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o
# Maj : 26/05/2022

extends = /model/math/expr.pl

title = Opérations sur les petits "o" : Produit 1.

before ==
var('x')
n = randint(1, 5)
m = randint(1,5)
sol = x**(n+m)
==

question ==
Simplifier l'expression ci-dessous (pour $!x!$ qui tend vers $! 0 !$) en l'écrivant sous la forme
 $! o(x^n) !$ avec $! n \in \mathbb N !$ le plus grand possible.
==

embed ==
# ) \quad [x \rightarrow 0]
==

prefix ==
$! x^{{n|latex}} \times o(x^{{m|latex}}) = o( !$
==

solution ==
$$ x^{{n|latex}} \times o(x^{{m|latex}}) = o({{ sol|latex }})  $$

En effet, il faut appliquer ici la règle suivante : Si $! n , m \in \mathbb N !$ alors $! x^n \times o(x^m) = o(x^{n+m}) !$.
==

latexsettings.order = 'ilex'


