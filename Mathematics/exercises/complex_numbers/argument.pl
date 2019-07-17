extends = /Mathematics/template/mathexpr.pl

title = Argument d'un nombre complexe

lang = fr

imaginary_unit = i

before ==
z=I
z_tex=latex(z)
sol=0
==

text = Déterminer un argument du nombre complexe $% z= {{z_tex}} %$.

evaluator==
score,numerror,feedback=ans_number(answer['1'],sol)
==


