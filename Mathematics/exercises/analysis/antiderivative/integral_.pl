extends = /Mathematics/template/mathinput.pl

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

var('x')
a=randint(-5,5,[0])
b,c=list_randint_norep(2,-5,5,[0])
x0,x1=list_randint_norep(2,-2,2)
d=randint(2,3)
f=rand_int_poly(d,2,3)
f=randitem([a*sqrt(b*x+c),a/sqrt(b*x+c)])
f=simplify(f)
f_tex=latex(f)
sol=integrate(f,(x,x0,x1).doit()
sol_tex=latex(sol)
==

text ==
Calculer l'intégrale $! \displaystyle \int_{ {{x0}} }^{ {{x1}} } {{f_tex}} dx.$$
==

evaluator==
var('x')
score,_,feedback=ans_expr(input.value,sol)
==

solution ==
L'intégrale vaut $! {{sol}} !$.
==

