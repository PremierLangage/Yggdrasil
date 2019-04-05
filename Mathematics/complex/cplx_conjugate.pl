extends = /Mathematics/template/mathexpr.pl

title = Conjugué d'un nombre complexe

lang = fr

imaginary_unit= i

before ==
z=rand_complex_int(5)
latexz=latex(z)
sol=conjugate(z)
==

text = Quel est le conjugué du nombre complexe $%z ={{latexz}}%$ ?

form ==
{{input_1 | safe}}
==

input.1.type = mathexpr

evaluator ==
score,numerror,texterror=ans_complex(answer['1'],sol,imaginary_unit)
==






