extends = /Mathematics/template/mathinput.pl

title = Module d'un nombre complexe

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

a=randitem([-1,1])*[1,2,3,4,5,sqrt(2),sqrt(3),sqrt(5)]
b=randitem([-1,1])*[1,2,3,4,5,sqrt(2),sqrt(3),sqrt(5)]

z=a+b*I
z_tex=latex(z)
sol=abs(z)
sol_tex=latex(sol)
==

text = Déterminer le module du nombre complexe $% z= {{z_tex}} %$.

evaluator==
score,_,feedback=ans_expr(input.value,sol)
==

solution==
Le module de $! z !$ est $% \displaystyle {{sol_tex}} %$.
==



