extends = /Mathematics/template/mathinput.pl

title = Opération sur les nombres complexes

before ==
keyboards_JSON['virtualKeyboards']="complexes"
input.config = keyboards_JSON

z1=rand_complex_int(5)
z2=rand_complex_int(5)
while z1==z2:
    z2=rand_complex_int(5)
z1b=conjugate(z1)
z2b=conjugate(z2)

formula=randitem(eval(param['formulas']))

if formula=="z1+z2":
    sol=z1+z2
    expr="z_1 + z_2"
elif formula=="z1-z2":
    sol=z1-z2
    expr="z_1 - z_2"
elif formula=="z1*z2":
    sol=z1*z2
    expr=r"z_1 \times z_2"
elif formula=="z^2":
    sol=z1*z1
    expr=r"z^2"
elif formula=="1/z":
    sol=1/z1
    expr=r"\frac{1}{z}"
elif formula=="1/(z1*z2)":
    sol=1/(z1*z2)
    expr=r"\frac{1}{z_1 \times z_2}"
elif formula=="z1/z2":
    sol=z1/z2
    expr=r"\frac{z_1}{z_2}"
elif formula=="(z1+z2)b":
    sol=z1b+z2b
    expr="\overline{z_1+ z_2}"
elif formula=="z1b+z2b":
    sol=z1b+z2b
    expr="\overline{z_1}+ \overline{z_2}"
elif formula=="z1b+z2":
    if randitem([1,2])==1:
        sol=z1b+z2
        expr="\overline{z_1} + z_2"
    else:
        sol=z1+z2b
        expr="z_1 + \overline{z_2}"
elif formula=="(z1-z2)b":
    sol=z1b-z2b
    expr="\overline{z_1 - z_2}" 
elif formula=="z1b-z2b":
    sol=z1b-z2b
    expr="\overline{z_1} - \overline{z_2}"
elif formula=="z1b-z2":
    if randitem([1,2])==1:
        sol=z1b-z2
        expr="\overline{z_1} - z_2"
    else:
        sol=z1-z2b
        expr="z_1 - \overline{z_2}"   
elif formula=="(z1*z2)b":
    sol=z1b*z2b
    expr=r"\overline{z_1 \times z_2}" 
elif formula=="z1b*z2b":
    sol=z1b*z2b
    expr=r"\overline{z_1} \times \overline{z_2}"
elif formula=="z1b*z2":
    if randitem([1,2])==1:
        sol=z1b*z2
        expr=r"\overline{z_1} \times z_2"
    else:
        sol=z1*z2b
        expr="z_1 \times \overline{z_2}"  
elif formula=="(z1/z2)b":
    sol=z1b*z2b
    expr=r"\overline{\left(\frac{z_1}{z_2}\right)}" 
elif formula=="z1b*z2b":
    sol=z1b*z2b
    expr=r"\frac{ \overline{z_1} }{ \overline{z_2} }"
elif formula=="z1b/z2":
    if randitem([1,2])==1:
        sol=z1b*z2
        expr=r"\frac{ \overline{z_1} }{ z_2 }"
    else:
        sol=z1*z2b
        expr="\frac{ z_1 }{ \overline{z_2} }"  

latexsol=latex(sol.expand())
latexz1=latex(z1)
latexz2=latex(z2)

if formula in ["z^2","1/z"]:
    text =r"On considère le nombre complexe $! z= %s !$. Calculer $! \displaystyle %s !$ (sous forme cartésienne)." % (latexz1,expr)
else:
    text =r"On considère les nombres complexes $! z_1= %s !$ et $! z_2= %s !$. Calculer $! \displaystyle %s !$ (sous forme cartésienne)." % (latexz1,latexz2,expr)
==

evaluator==
score,_,feedback=ans_complex(input.value,sol,form="cartesian")
==

solution ==
La solution est $% {{latexsol}} %$.
==

wims ==
\if{\type=13}{
\text{nz=1}
\text{expr=z^2}
\complex{rep=(\z1)^2}
}

\if{\type=14}{
\text{nz=1}
\text{expr=randitem(\overline{z} \times \z,z \times \overline{z})}
\complex{rep=(\zb1) * (\z1)}
}

\if{\type=15}{
\text{nz=1}
\text{expr=\overline{z}^2}
\complex{rep=(\zb1)^2}
}
\if{\type=16}{
\text{nz=1}
\text{expr=\overline{z^2}}
\complex{rep=(\zb1)^2}
}

\if{\type=17}{
\text{expr=\frac{z_1}{z_2}}
\complex{rep=(\z1)/(\z2)}
}
\if{\type=18}{
\if{randint(1..2)=1}{
\text{expr=\frac{\overline{z_1}}{z_2}}
\complex{rep=(\zb1)/(\z2)}
}{
\text{expr=\frac{z_1}{\overline{z_2}}}
\complex{rep=(\z1)/(\zb2)}
}
}
\if{\type=19}{
\text{expr=\frac{\overline{z_1}}{\overline{z_2}}}
\complex{rep=(\zb1)/(\zb2)}
}
\if{\type=20}{
\text{expr=\overline{\left(\frac{z_1}{z_2}\right)}}
\complex{rep=(\zb1)/(\zb2)}
}

\if{\type=21}{
\text{nz=1}
\text{expr=\frac{1}{z}}
\complex{rep=1/(\z1)}
}

\if{\type=22}{
\text{nz=1}
\text{expr=\frac{1}{\overline{z}}}
\complex{rep=1/(\zb1)}
}

\if{\type=23}{
\text{nz=1}
\text{expr=\overline{\left(\frac{1}{z}\right)}}
\complex{rep=1/(\zb1)}
==











