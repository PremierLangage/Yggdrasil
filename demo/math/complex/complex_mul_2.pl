extends = /model/math/multinput2.pl

title = Nombres Complexes

before == #|python|
inputs = [MathInput() for _ in range(3)]
prefixes = []
for i in range(3):
    z1 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
    z2 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
    s = latex(z1 * z2)
    prefixes.append(f"$! {s} = !$")
    inputs[i].sol = (z1 * z2).expand()
    inputs[i].type = "complex"
    inputs[i].evalparam = {'form': 'cartesian'}
==

question == 
Calculer les produits de nombres complexes suivants (sous forme algébrique).
==