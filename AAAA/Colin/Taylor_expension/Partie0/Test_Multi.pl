extends = /model/math/multimathinput.pl

title = Nombres Complexes

before == #|python|
n = 2
inputs = [MathInput(type="expr") for _ in range(n)]
prefixes = []

for i in range(n):
    if i==0 :
        var('x')
        n = randint(1, 10)
        m = randint(1,10)
        X1 = x**n
        X11 = latex(X1)
        X2 = x**m
        X22 = latex(X2)
        prefixes.append(f"$! o({X11}) + o({X22}) = o( !$")
        inputs[i].sol = X1 * X2
        inputs[i].set_embed(r"#) \quad [x \rightarrow 0]")
    else :
        a=2
        b=3
        s = latex(a * b)
        prefixes.append(f"$! {s} = !$")
        inputs[i].sol = a*b
==

question == 
Simplifier l'expression ci-dessous (pour $!x!$ qui tend vers $! 0 !$) en l'écrivant sous la forme
 $! o(x^n) !$ avec $! n \in \mathbb N !$ le plus grand possible.
==
