extends = /Mathematics/template/mathinput.pl

title = Conversion

lang = fr

before ==
with evaluate(False):
    z=2*exp(I*pi/3)
latexz=latex(z)
==

text = Ecrire sous forme cartésienne le nombre complexe $%\\large z= {{latexz}} %$.

evaluator==
score,_,feedback=ans_complex(input1.value,z,form="cartesian")
==



