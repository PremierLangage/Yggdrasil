# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o
# Maj : 26/05/2022

extends = /model/math/expr.pl

title = Opérations sur les petits "o" : Somme.

before ==
var('x')
n = randint(1, 10)
m = randint(1,10)
X1 = x**n
X2 = x**m
sol = x**min(n,m)
==

question ==
Simplifier l'expression ci-dessous (pour $!x!$ qui tend vers $! 0 !$) en l'écrivant sous la forme
 $! o(x^n) !$ avec $! n \in \mathbb N !$ le plus grand possible.
==

embed ==
# ) \quad [x \rightarrow 0]
==

prefix ==
$! o({{X1|latex}}) + o({{X2|latex}}) = o( !$
==

solution ==
$$ o({{X1|latex}}) + o({{X2|latex}}) = o({{ sol|latex }})  .$$

En effet, il faut appliquer ici la règle suivante : Si $! n \leq m!$ alors $! o(x^n) + o(x^m) = o(x^n) !$.
==

latexsettings.order = 'ilex'

