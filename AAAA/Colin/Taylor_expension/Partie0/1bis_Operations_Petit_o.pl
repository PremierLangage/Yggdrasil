# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o
# Maj : 26/05/2022

extends = /model/math/expr.pl

title = Opérations sur les petits "o" : Différence.

before ==
var('x')
n = randint(1, 10)
m=n+1
X1 = x**n
X2 = x**m
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
$! o({{X1|latex}}) - o({{X1|latex}}) = o( !$
==

solution ==
$$ o({{X1|latex}}) - o({{X1|latex}}) = o({{ sol|latex }})  .$$

Il faut appliquer ici la règle suivante : $! o(x^n) - o(x^n) = o(x^n) !$.
En effet, la différence de deux petits "o" d'une même puissance n'est bien souvent pas égale à 0. Par exemple :
$$2{{X2|latex}} = o({{X1|latex}}), \quad {{X2|latex}} = o({{X1|latex}}), \quad \text{et } \quad 2{{X2|latex}} - {{X2|latex}} = {{X2|latex}} \neq 0.$$
==

latexsettings.order = 'ilex'


