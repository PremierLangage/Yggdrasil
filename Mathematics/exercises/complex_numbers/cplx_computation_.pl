# Author: D. Doyen
# Tags: complex numbers
# 29/4/2021

extends = /model/math/complex.pl

title = Opération sur les nombres complexes

param.formulas % ["add","sub"]

jinja_keys % ["text", "text1", "text1", "solution", "input_prefix"]

before ==
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
elif formula == "mul":
    sol = z1 * z2
    expr = r"z_1 \times z_2"
elif formula == "sq":
    sol = z1 * z1
    expr = r"z^2"
elif formula == "inv":
    sol = 1/z1
    expr = r"\frac{1}{z}"
elif formula == "invmul":
    sol = 1/(z1*z2)
    expr = r"\frac{1}{z_1 \times z_2}"
elif formula == "div":
    sol = z1/z2
    expr = r"\frac{z_1}{z_2}"
elif formula == "conjadd":
    sol = z1b+z2b
    expr = "\overline{z_1+ z_2}"
elif formula == "addconj":
    sol = z1b+z2b
    expr = "addmix"
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
# cases remaining to do :
# sqconj, conjsq

sol = sol.expand()

if formula in ["sq","inv"]:
    text = text1
else:
    text = text2
==
