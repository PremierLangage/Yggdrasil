extends = /model/math/multimathinput.pl

title = Division

before == #|python|
inputs = [MathInput(type="complex", evalparam={'form': 'cartesian'}) for _ in range(3)]

prefixes = []
for i in range(3):
    if i < 2:
        z1 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
        z2 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
    else:
        z1 = 1
        z2 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
    s = latex(z1 / z2)
    prefixes.append(f"$! {s} = !$")
    inputs[i].sol = (z1/z2).expand()
==

question == 
Calculer les quotients de nombres complexes suivants (sous forme algébrique).
==

