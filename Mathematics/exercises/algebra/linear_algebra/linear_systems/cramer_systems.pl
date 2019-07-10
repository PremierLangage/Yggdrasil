extends = /Mathematics/template/mathexpr.pl

title = Système linéaire 2x2

lang = fr

matsize = 2

coeffbound = 5

before ==
A=rand_int_matrix(int(matsize),int(matsize),int(coeffbound))
B=rand_int_matrix(int(matsize),1,int(coeffbound))
sol=list(linsolve((A, B)))[0]
sys_tex=latexsys(A,B)
==

text ==
Déterminer les solutions du système
$$ {{sys_tex}} $$
==

form ==
x= {{input_1 | safe}}
y= {{input_2 | safe}}
==

input.1.type = mathexpr
input.1.virtualKeyboardMode = manual
input.1.virtualKeyboards = elementary

input.2.type = mathexpr
input.2.virtualKeyboardMode = manual
input.2.virtualKeyboards = elementary

evaluator ==
score,_,feedback=ans_tuple_expr((answer['1'],answer['2']),sol)
==
