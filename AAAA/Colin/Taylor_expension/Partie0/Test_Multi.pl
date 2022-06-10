extends = /model/math/multimathinput.pl

title = Nombres Complexes

before == #|python|
n = 2
inputs = [MathInput(type="expr") for _ in range(n)]
prefixes = []

for i in range(n):
    if i==1 :
        a=1
        b=2
        s = latex(a * b)
        prefixes.append(f"$! {s} = !$")
        inputs[i].sol = a*b
    else
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
