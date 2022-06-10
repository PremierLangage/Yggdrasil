extends = /model/math/multimathinput.pl

title = Nombres Complexes

before == #|python|
n = 3
inputs = [MathInput(type="expr") for _ in range(n)]
prefixes = []

types = [0, 0, 1, 1]

def generate(i):
    prefix = i
    sol = i
    return prefix, sol

for i in range(n):
    prefixes.append(f"Question {i}")
    inputs[i].sol = 0
    inputs[i].set_embed(r"# + o(x^3) \quad [x \rightarrow 0]")  
==

question == 
Calculer les produits de nombres complexes suivants (sous forme algébrique).
==
