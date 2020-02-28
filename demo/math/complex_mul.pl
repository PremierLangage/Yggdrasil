extends = /model/math.pl

title = Opération sur les nombres complexes

before ==
keyboards_JSON['virtualKeyboards']="complexes"
input.config = keyboards_JSON

z1=rand_complex_int(5)
z2=rand_complex_int(5)
sol=(z1*z2).expand()
==

input =: MathInput

text ==
On considère les nombres complexes $! z_1 = {{z1.latex}} !$ et $! z_2= {{z2.latex}} !$. Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==


form ==
{{ input | component }}
==

evaluator ==
score,_,feedback = eval_complex(input.value,sol,form="cartesian")
==

