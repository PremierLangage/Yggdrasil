extends = /Mathematics/template/mathexpr.pl

title = Somme de deux nombres complexes

lang = fr

imaginary_unit = i

before ==
z1=rand_complex_int(5)
z2=rand_complex_int(5)
if param['formula']=="z1+z2":
    sol=z1+z2
    expr="z_1 + z_2"
elif param['formula']=="z1-z2":
    sol=z1-z2
    expr="z_1 - z_2"
elif param['formula']=="z1*z2":
    sol=z1*z2
    expr=r"z_1 \times z_2"
elif param['formula']=="z1/z2":
    sol=z1/z2
    expr="z_1/z_2"
elif param['formula']=="z1+z2b":
    sol=z1/z2b
    expr="z_1 + \overline{z_2}"

latexsol=latex(sol.expand())
latexz1=latex(z1)
latexz2=latex(z2)
==

text = On considère les nombres complexes $% z_1= {{latexz1}} %$ et $% z_2= {{latexz2}} %$. Calculer $% {{expr}} %$.

evaluator==
score,_,feedback=ans_complex_cartesian(answer['1'],sol,"i")
==

solution ==
La solution est $${{latexsol}}$$.
==

wims ==
\if{\type=2}{
\if{randint(1..2)=1}{
\text{expr=\overline{z_1} + z_2}
\complex{rep=\zb1 + (\z2)}
}{
\text{expr=z_1 + \overline{z_2}}
\complex{rep=\z1 + (\zb2)}
}
}
\if{\type=3}{
\text{expr=\overline{z_1} + \overline{z_2}}
\complex{rep=\zb1 + (\zb2)}
}
\if{\type=4}{
\text{expr=\overline{z_1 + z_2}}
\complex{rep=\zb1 + (\zb2)}
}


\if{\type=6}{
\if{randint(1..2)=1}{
\text{expr=\overline{z_1} - z_2}
\complex{rep=\zb1 - (\z2)}
}{
\text{expr=z_1 - \overline{z_2}}
\complex{rep=\z1 - (\zb2)}
}
}
\if{\type=7}{
\text{expr=\overline{z_1} - \overline{z_2}}
\complex{rep=\zb1 - (\zb2)}
}
\if{\type=8}{
\text{expr=\overline{z_1 - z_2}}
\complex{rep=\zb1 - (\zb2)}
}

\if{\type=9}{
\text{expr=z_1 \times z_2}
\complex{rep=(\z1) *(\z2)}
}
\if{\type=10}{
\if{randint(1..2)=1}{
\text{expr=\overline{z_1} \times z2}
\complex{rep=(\zb1) * (\z2)}
}{
\text{expr=z_1 \times \overline{z_2}}
\complex{rep=(\z1) * (\zb2)}
}
}
\if{\type=11}{
\text{expr=\overline{z_1} \times \overline{z_2}}
\complex{rep=(\zb1) * (\zb2)}
}
\if{\type=12}{
\text{expr=\overline{z_1 \times z_2}}
\complex{rep=(\zb1) * (\zb2)}
}

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



