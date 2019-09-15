extends = /Mathematics/template/mathinput.pl

title = Conversion

lang = fr

before ==
with sp.evaluate(False):
    z=2*exp(sp.I*sp.pi/3)
latexz=latex(z)
rp=latex(sp.re(z.expand(complex=True)))
ri=latex(sp.im(z.expand(complex=True)))
==

text = Ecrire sous forme cartésienne le nombre complexe $%\\large z= {{latexz}} %$.

evaluator==
score,_,feedback=ans_complex(input1.value,z,form="cartesian")
==



