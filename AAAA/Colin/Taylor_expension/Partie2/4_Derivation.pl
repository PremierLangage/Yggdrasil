# Auteur : Colin Petitjean
# Sujet : Développements Limités - Dérivation d'un DL
# Maj : 9/06/2022

title = DL - Dérivation d'un développement limité

extends = /model/math/expr.pl

before ==
from sympy import Symbol, factorial, S
var('x')
n = 4
m=n-1

P = randint(-3, 3) + randint(-3, 3)*x + randint(-3, 3)*x**2  + randint(-3, 3)*x**3  + randint(-3, 3)*x**4 

sol=diff(P,x)
==

question ==
Soit $! f !$ une fonction de classe $!\mathcal C^{{n|latex}} !$ sur $!\mathbb R!$. On suppose que $! f !$ possède le développement limité en 0 et à l'ordre $! {{ n|latex }} !$ suivant
$$ f(x) = {{P|latex}} + o(x^4).  $$ 
En déduire le développement limité de $! f' !$ en 0 et à l'ordre $! {{ m|latex }} !$.
==

embed ==
# + o(x^{{ m|latex }}) \quad [x \rightarrow 0]
==

prefix ==
$! f'(x) = !$
==

solution ==
$$ f'(x) = {{ sol|latex }} + o(x^{{ m|latex }})  \quad [x \rightarrow 0].$$
==

latexsettings.order = 'ilex'
