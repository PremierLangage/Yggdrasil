extends = /Mathematics/template/mathexpr.pl

title = Argument d'un nombre complexe

lang = fr

imaginary_unit = i

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

z=randitem([I,-I,1,-1,1+I,1-I,I-1,-1-I])
z=randint(1,3)*z
z_tex=latex(z)
sol=arg(z)
sol_tex=latex(sol)
==

text = Déterminer un argument du nombre complexe $% z= {{z_tex}} %$.

evaluator==
score,_,feedback=ans_expr(input1.value,sol,modulo=2*pi)
==

solution==
Un argument de $! z !$ est $% \displaystyle {{sol_tex}} %$.
==

