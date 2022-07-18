# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o
# Maj : 26/05/2022

extends = /model/math/expr.pl

title = Opérations sur les petits "o" : Multiplication par une constante non nulle.

before ==
var('x')
n = randint(2, 6)
m = randint(-10,10,[0])
sol = x**n
==

question ==
Simplifier l'expression ci-dessous (pour $!x!$ qui tend vers $! 0 !$) en l'écrivant sous la forme
 $! o(x^n) !$ avec $! n \in \mathbb N !$ le plus grand possible.
==

embed ==
# ) \quad [x \rightarrow 0]
==

prefix ==
$! {{m|latex}} \times o(x^{{n|latex}}) = o( !$
==

solution ==
$$ {{m|latex}} \times o(x^{{n|latex}}) =  o({{ sol|latex }})  .$$


En effet, il faut appliquer ici la règle suivante : Si $! C \in \mathbb R^* !$ et $!n \in \mathbb N!$ alors $!C \times o(x^n) = o(x^{n}) !$.
==

latexsettings.order = 'ilex'


