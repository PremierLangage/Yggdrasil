extends = /Mathematics/template/mathinput.pl

title = Conversion

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="complexes"
input1.config = keyboards_JSON
with evaluate(False):
    z=exp(I*pi/4)
sol=expand_complex(z)

latexz=latex(z)
==

text = {{sol}} Ecrire sous forme cartésienne le nombre complexe $%\\large z= {{latexz}} %$.

evaluator==
score,_,feedback=ans_complex(input1.value,z,form="cartesian")
==



