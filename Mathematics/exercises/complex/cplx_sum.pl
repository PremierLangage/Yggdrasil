extends = /Mathematics/template/mathexpr.pl

title = Somme de deux nombres complexes

lang = fr

imaginary_unit = i

before ==
z1=rand_complex_int(5)
z2=rand_complex_int(5)
sol=z1+z2
latexz1=latex(z1)
latexz2=latex(z2)
==

text = On considère les nombres complexes $% z_1= {{latexz1}} %$ et $% z_2= {{latexz2}} %$. Calculer $% z_1+z_2 %$.

evaluator==
score,numerror,feedback=ans_complex_cartesian(answer['1'],sol,imaginary_unit)
==



