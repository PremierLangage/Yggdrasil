extends = /Mathematics/template/mathexpr.pl

title = Module d'un nombre complexe

lang = fr

imaginary_unit = i

before ==
z=rand_complex_int(5)
z_tex=latex(z)
sol=abs(z)
==

text = Déterminer le module du nombre complexe $% z= {{z_tex}} %$.

evaluator==
score,numerror,feedback=ans_number(answer['1'],sol)
==


