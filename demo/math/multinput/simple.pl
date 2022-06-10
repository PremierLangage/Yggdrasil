extends = /model/math/multimathinput.pl

title = Nombres Complexes

before == #|python|
n = 3
inputs = [MathInput(type="expr") for _ in range(n)]
prefixes = []
for i in range(n):
    prefixes.append(f"Question {i}")
    inputs[i].sol = 0
    #inputs[i].embed = r"# + o(x^3) \quad [x \rightarrow 0]"    
==

question == 
Calculer les produits de nombres complexes suivants (sous forme algébrique).
==
