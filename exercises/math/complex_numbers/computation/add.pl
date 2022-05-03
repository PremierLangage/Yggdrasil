extends = /model/math/multimathinput.pl

title = Addition

before == #|python|
inputs = [MathInput(type="complex", evalparam={'form': 'cartesian'}) for _ in range(3)]

prefixes = []
for i in range(3):
    if i < 2:
        z1 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
        z2 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
        s = latex(z1 * z2)
    else:
        z1 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
        z2 = z1
        s = latex(z1**2)
    prefixes.append(f"$! {s} = !$")
    inputs[i].sol = (z1 * z2).expand()
==

question == 
On considère les nombres complexes $! z_1= {{ z1|latex }} !$ et $! z_2= {{ z2|latex }} !$. Calculer les expressions suivantes (sous forme algébrique).
==