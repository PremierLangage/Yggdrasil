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
feedback=input
==



wims ==
\text{data=randomrow(
 i*z, - y, x
 -i*z, y, -x
 \n*z,\n*x,\n*y
 z + i,x,y + 1
 z - i,x,y - 1
 i - z, - x,1 - y
 \n + z,x + \n,y
 \n - z,\n - x, - y
 z - \n,x - \n,y
 \n + i*z,\n - y,x
 \n - i*z,\n + y, -x
 i*z - \n,-y - \n,x
 z + \n*i,x,y + \n
 z - \n*i,x,y - \n
 \n*i - z, - x,\n - y
 conj(z),x, - y
 i*conj(z),y,x
  - i*conj(z), - y, - x
 \n*conj(z),\n*x, - \n*y
 conj(z) + i,x, - y + 1
 conj(z) - i,x, - y - 1
 i - conj(z), - x,1 + y
 \n + conj(z),x + \n, - y
 \n - conj(z),\n - x,y
 conj(z) - \n,x - \n,-y
 z + \n + i,x + \n,y + 1
 z - \n + i,x - \n,y + 1
 z - \n - i,x - \n,y - 1
 z + \n - i,x + \n,y - 1
 \n + i - z,\n - x,1 - y
)}
==




