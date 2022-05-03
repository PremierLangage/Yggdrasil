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

from sympy import conjugate

n = 5
z1 = randint(-n, n, [0]) + randint(-n, n, [0])*I
z2 = randint(-n, n, [0]) + randint(-n, n, [0])*I
while z1==z2:
    z2 = randint(-n, n, [0]) + randint(-n, n, [0])*I

z1b = conjugate(z1)
z2b = conjugate(z2)

formula = choice(param['formulas'])

if formula == "add":
    sol = z1 + z2
    expr = "z_1 + z_2"
elif formula == "sub":
    sol = z1 - z2
    expr = "z_1 - z_2"


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