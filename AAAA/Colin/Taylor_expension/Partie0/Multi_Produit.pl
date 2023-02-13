# Auteur : Colin Petitjean
# Sujet : développements limités - Manipuler les petits o
# Maj : 10/06/2022

extends = /model/math/multimathinput.pl

title = Opérations sur les petits "o" : Produit

before == #|python|
e = 3
inputs = [MathInput(type="expr") for _ in range(e)]
prefixes = []

for i in range(e):
    if i==0 :
        var('x')
        n = randint(2, 6)
        m = randint(-10,10,[0])
        s = x**n
        xn = latex(s)
        mm = latex(m)
        prefixes.append(f"$! {mm} \cdot o({xn}) = o(  !$")
        inputs[i].sol = s
        inputs[i].set_embed(r"#) \quad [x \rightarrow 0]")
    if i==1 :
        var('x')
        n = randint(1, 5)
        m = randint(1,5)
        s = x**(n+m)
        xn = latex(x**n)
        xm = latex(x**m)
        prefixes.append(f"$! {xn} \cdot o({xm}) = o(  !$")
        inputs[i].sol = s
        inputs[i].set_embed(r"#) \quad [x \rightarrow 0]")
    if i==2 :
        var('x')
        n = randint(1,5)
        m = randint(1,5)
        s = x**(n+m)
        xn = latex(x**n)
        xm = latex(x**m)
        prefixes.append(f"$! o({xn}) \cdot o({xm}) = o(  !$")
        inputs[i].sol = s
        inputs[i].set_embed(r"#) \quad [x \rightarrow 0]")
==

question == 
Simplifier les expressions ci-dessous (pour $!x!$ qui tend vers $! 0 !$) en les écrivant sous la forme
 $! o(x^n) !$ avec $! n \in \mathbb N !$ le plus grand possible.
==


latexsettings.order = 'ilex'
