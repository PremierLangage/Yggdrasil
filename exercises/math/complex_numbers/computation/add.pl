extends = /model/math/multimathinput.pl

title = Addition

before == #|python|
inputs = [MathInput(type="complex", evalparam={'form': 'cartesian'}) for _ in range(3)]

from sympy import conjugate
from sympy2latex import latex_lincomb

n = 5
z1 = randint(-n, n, [0]) + randint(-n, n, [0])*I
z2 = randint(-n, n, [0]) + randint(-n, n, [0])*I
while z1 == z2:
    z2 = randint(-n, n, [0]) + randint(-n, n, [0])*I

#z1b = conjugate(z1)
#z2b = conjugate(z2)

prefixes = []
sols = []

prefixes.append(f"$! z_1 + z_2 = !$")
sols.append((z1 + z2).expand())

prefixes.append(f"$! z_1 - z_2 = !$")
sols.append((z1 - z2).expand())

coeff = [choice([-1, 1]), choice([-3, -2, 2, 3])]
shuffle(coeff)
s = latex_lincomb(coeff , ["z_1", "z_2"])
prefixes.append(f"$! {s} = !$")
sols.append((coeff[0]*z1 + coeff[1]*z2).expand())

for i in range(3):
    inputs[i].sol = sols[i]
==

question == 
On considère les nombres complexes $! z_1= {{ z1|latex }} !$ et $! z_2= {{ z2|latex }} !$. Calculer les expressions suivantes (sous forme algébrique).
==

old ==

elif formula == "conjadd":
    sol = z1b+z2b
    expr = "\overline{z_1+ z_2}"
elif formula == "addconj":
    sol = z1b+z2b
    expr = "\overline{z_1} + \overline{z_2}"
elif formula == "z1b+z2":
    if randitem([1,2])==1:
        sol = z1b+z2
        expr = "\overline{z_1} + z_2"
    else:
        sol = z1+z2b
        expr = "z_1 + \overline{z_2}"
elif formula == "conjsub":
    sol = z1b-z2b
    expr = "\overline{z_1 - z_2}" 
elif formula == "subconj":
    sol = z1b-z2b
    expr = "\overline{z_1} - \overline{z_2}"
elif formula == "submix":
    if randitem([1,2])==1:
        sol = z1b-z2
        expr = "\overline{z_1} - z_2"
    else:
        sol = z1-z2b
        expr = "z_1 - \overline{z_2}"   
elif formula == "conjmul":
    sol = z1b*z2b
    expr = r"\overline{z_1 \times z_2}" 
elif formula == "mulconj":
    sol = z1b*z2b
    expr = r"\overline{z_1} \times \overline{z_2}"
elif formula == "mulmix":
    if randitem([1,2])==1:
        sol = z1b*z2
        expr = r"\overline{z_1} \times z_2"
    else:
        sol = z1*z2b
        expr = "z_1 \times \overline{z_2}"  
elif formula == "conjdiv":
    sol = z1b/z2b
    expr = r"\overline{\left(\frac{z_1}{z_2}\right)}" 
elif formula == "divconj":
    sol = z1b/z2b
    expr = r"\frac{ \overline{z_1} }{ \overline{z_2} }"
elif formula == "divmix":
    if randint(0,1) == 1:
        sol = z1b*z2
        expr = r"\frac{ \overline{z_1} }{ z_2 }"
    else:
        sol = z1*z2b
        expr = "\frac{ z_1 }{ \overline{z_2} }" 
==