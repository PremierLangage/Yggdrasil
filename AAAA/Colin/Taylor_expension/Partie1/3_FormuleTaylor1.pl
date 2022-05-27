# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler la formule de Taylor-Young 1

title = DL - Formule de Taylor-Young 1

extends = /model/math/expr.pl

before ==
var('x')
n = 4
a0 = randint(-10, 10)
a1 = randint(-10, 10)
a2 = randint(-10, 10)
a3 = randint(-10, 10)
a4 = randint(-10, 10)
sol = a0 + a1 * x + a2 * x**2/2 + a3 * x**3/6 + a4 * x**4/24
==

question ==
Soit $! f !$ une fonction de classe $!\mathcal C^{{n|latex}} !$ sur $!\mathbb R!$ telle que 
$$ f(0) = {{a0|latex}}, \quad f^{'}(0) = {{a1|latex}}, \quad f^{''}(0) = {{a2|latex}}, \quad f^{(3)}(0) = {{a1|latex}}, \quad f^{(4)}(0) = {{a4|latex}}.$$ 
A l'aide de la formule de Taylor-Young, donner le développement limité de $! f !$ en 0 et à l'ordre $! {{ n|latex }} !$.
==

embed ==
# + o(x^{{ n|latex }}) \quad [x \rightarrow 0]
==

prefix ==
$! f(x) = !$
==

solution ==
$! f(x) = {{ sol|latex }} + o(x^{{ n|latex }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'
