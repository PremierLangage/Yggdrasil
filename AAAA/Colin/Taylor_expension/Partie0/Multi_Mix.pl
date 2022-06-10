# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o
# Maj : 10/06/2022

extends = /model/math/multimathinput.pl

title = Opérations sur les petits "o" : Mix.

before == #|python|
e = 2
inputs = [MathInput(type="expr") for _ in range(e)]
prefixes = []

for i in range(e):
    var('x')
    n = randint(1, 3)
    Xn = x**n
    m = randint(1,3)
    Xm = x**m
    S=n+m
    a=randint(2,10)
    b=randint(-10,-2)
    l=randint(11,8)
    k=randint(2,7)
    s = x**min(n+m,l)
    xn = latex(Xn)
    xm = latex(Xm)
    prefixes.append(f"$! {a} o({xn}) \cdot {xm} + x^{k} {b} o(x^{l})= o( !$")
    inputs[i].sol = s
    inputs[i].set_embed(r"#) \quad [x \rightarrow 0]")
==


question == 
Simplifier les expressions ci-dessous (pour $!x!$ qui tend vers $! 0 !$) en les écrivant sous la forme
 $! o(x^n) !$ avec $! n \in \mathbb N !$ le plus grand possible.
==

solution ==
$! {{a|latex}}  {{Xn|latex}} \times o({{Xm|latex}}) + x^{ {{k|latex}} }  {{b|latex}} o(x^{{l|latex}}) = o(x^{ {{S|latex}} }) + x^{ {{k|latex}} } + o(x^{{l|latex}}) = o({{ sol|latex }})  !$.
==


latexsettings.order = 'ilex'
