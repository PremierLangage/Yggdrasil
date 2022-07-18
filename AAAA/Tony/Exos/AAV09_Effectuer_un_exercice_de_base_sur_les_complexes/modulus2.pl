extends = /Mathematics/template/mathinput.pl

title = Module d'un nombre complexe

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

a=randitem([-1,1])*randitem([1,2,3,4,5,sqrt(2),sqrt(3),sqrt(5)])
b=randitem([-1,1])*randitem([1,2,3,4,5,sqrt(2),sqrt(3),sqrt(5)])
c=randitem([-1,1])*randitem([1,2,3,4,5,sqrt(2),sqrt(3),sqrt(5)])
d=randitem([-1,1])*randitem([1,2,3,4,5,sqrt(2),sqrt(3),sqrt(5)])

z1=a+b*I
z2=c+d*I
cas=randint(1,3)
if cas==1:
    z=z1*z2
    z_tex=r"( %s )( %s )" % (latex(z1),latex(z2))
elif cas==2:
    z=z1/z2
    z_tex=r"\frac{ %s }{ %s }" % (latex(z1),latex(z2))
elif cas==3:
    z=1/(z1*z2)
    z_tex=r"\frac{ 1 }{ ( %s )( %s) }" % (latex(z1),latex(z2))
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




