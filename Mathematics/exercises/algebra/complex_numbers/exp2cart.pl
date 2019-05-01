extends = /Mathematics/template/mathexpr.pl

title = Conversion

lang = fr

imaginary_unit = i

before ==
with sp.evaluate(False):
    z=2*exp(sp.I*sp.pi/3)
latexz=latex(z)
rp=latex(sp.re(z.expand(complex=True)))
ri=latex(sp.im(z.expand(complex=True)))
==

text = Ecrire sous forme cartésienne le nombre complexe $%\\large z= {{latexz}} %$.

evaluator==
score,numerror,feedback=ans_complex_cartesian_coeff_rad(answer['1'],"i",z.expand(complex=True))
feedback=z.expand(complex=True)
==


