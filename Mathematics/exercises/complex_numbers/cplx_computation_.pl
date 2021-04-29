# Author: D. Doyen
# Tags: complex numbers
# 29/4/2021

extends = /model/math/complex.pl

title = Opération sur les nombres complexes

param.formulas % ["add","sub"]

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

sol = sol.expand()

if formula in ["sq","inv"]:
    text = """
    On considère le nombre complexe $! z= {{ z|latex }} !$. 
    Calculer $! \displaystyle {{ expr|latex }} !$ (sous forme algébrique).
    """
else:
    text = """
    On considère les nombres complexes $! z_1= {{ z1|latex }} !$ et $! z_2= {{ z2|latex }} !$. 
    Calculer $! \displaystyle {{ expr|latex }} !$ (sous forme algébrique).
    """
==

wims ==
\if{\type=14}{
\text{nz=1}
\text{expr = randitem(\overline{z} \times \z,z \times \overline{z})}
\complex{rep=(\zb1) * (\z1)}
}

\if{\type=15}{
\text{nz=1}
\text{expr = \overline{z}^2}
\complex{rep=(\zb1)^2}
}
\if{\type=16}{
\text{nz=1}
\text{expr = \overline{z^2}}
\complex{rep=(\zb1)^2}
}

\if{\type=17}{
\text{expr = \frac{z_1}{z_2}}
\complex{rep=(\z1)/(\z2)}
}
\if{\type=18}{
\if{randint(1..2)=1}{
\text{expr = \frac{\overline{z_1}}{z_2}}
\complex{rep=(\zb1)/(\z2)}
}{
\text{expr = \frac{z_1}{\overline{z_2}}}
\complex{rep=(\z1)/(\zb2)}
}
}
\if{\type=19}{
\text{expr = \frac{\overline{z_1}}{\overline{z_2}}}
\complex{rep=(\zb1)/(\zb2)}
}
\if{\type=20}{
\text{expr = \overline{\left(\frac{z_1}{z_2}\right)}}
\complex{rep=(\zb1)/(\zb2)}
}

\if{\type=21}{
\text{nz=1}
\text{expr = \frac{1}{z}}
\complex{rep=1/(\z1)}
}

\if{\type=22}{
\text{nz=1}
\text{expr = \frac{1}{\overline{z}}}
\complex{rep=1/(\zb1)}
}

\if{\type=23}{
\text{nz=1}
\text{expr = \overline{\left(\frac{1}{z}\right)}}
\complex{rep=1/(\zb1)}
==















