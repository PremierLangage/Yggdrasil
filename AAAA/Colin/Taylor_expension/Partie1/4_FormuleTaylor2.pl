# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler la formule de Taylor-Young 2

title = DL - Formule de Taylor-Young 1
extends = /model/math/expr.pl

before ==
var('x')
n = 4
m=randint(0,n)
a0 = randint(-10, 10)
a1 = randint(-10, 10)
a2 = randint(-10, 10)
a3 = randint(-10, 10)
a4 = randint(-10, 10)


sol = 
==

question ==
Soit $! f !$ une fonction de classe $!\mathcal C^{{n|latex}} !$ sur $!\mathbb R!$ ayant pour développement limité en 0 et à l'ordre 4 :
$$ f(x) = {{b0|latex}} + {{b1|latex}} * x + {{b2|latex}} * x**2 + {{b3|latex}} * x**3 + {{b4|latex}} * x**4 + o(x^4)$$
Retrouver à partir de la formule de Taylor-Youngla vameur de  $! f^{ {{m|latex}}}  !$.
==

embed ==
# + o({{ x }}^{{ n }}) \quad [x \rightarrow 0]
==

prefix ==
$! f(x) = !$
==

solution ==
$! {{ sol|latex }} + o({{ x }}^{{ n }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'
