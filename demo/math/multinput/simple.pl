extends = /model/math/multimathinput.pl

title = Nombres Complexes

before == #|python|
n = 4
inputs = [MathInput(type="expr") for _ in range(n)]
prefixes = []

types = [0, 0, 1, 4]

def generate(i):
    prefix = str(i)
    sol = i
    return prefix, sol

for i in range(n):
    prefix, sol = generate(types[i])
    prefixes.append("Question" + prefix)
    inputs[i].sol = sol
    inputs[i].set_embed(r"# + o(x^3) \quad [x \rightarrow 0]")  
==

question == 
Calculer les produits de nombres complexes suivants (sous forme algébrique).
==