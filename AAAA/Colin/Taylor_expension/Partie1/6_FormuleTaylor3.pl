# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler la formule de Taylor-Young 1

title = DL - Formule de Taylor-Young 1

extends = /model/math/expr.pl

before ==
var('x')
n = 3
A=[1,2]
a=choice(A)

L = []
for i in range(n+1) :
    b=randint(-10,10)
    L.append(b)

f = L[0] + L[1]*(x-a) + L[2]*(x-a)**2 + L[3]*(x-a)**3
sol = f

==

question ==
Soit $! f !$ une fonction de classe $!\mathcal C^{{n|latex}} !$ sur $!\mathbb R!$ telle que 
$$ f({{a|latex}}) = {{L[0]|latex}}, \quad f'({{a|latex}}) = {{L[1]|latex}}, \quad f^{''}({{a|latex}}) = {{L[2]|latex}}, \quad f^{(3)}({{a|latex}}) = {{L[3]|latex}}.$$ 
A l'aide de la formule de Taylor-Young, donner le développement limité de $! f !$ en {{a|latex}} à l'ordre $! {{ n|latex }} !$.
==

embed ==
# + o((x - {{a |latex }})^{{ n|latex }}) \quad [x \rightarrow {{a|latex}}]
==

prefix ==
$! f(x) = !$
==

solution ==
$! f(x) = {{L[0] | latex}} + {{L[1] | latex}}(x-{{a|latex}}) + \frac{ {{L[2] | latex}} }{2!} (x-{{a|latex}})^2 + \frac{ {{L[3] | latex}} }{3!} (x-{{a|latex}})^3 + o((x-{{a|latex}})^3)  \quad [x \rightarrow {{a | latex}}]!$.
==

latexsettings.order = 'ilex'
