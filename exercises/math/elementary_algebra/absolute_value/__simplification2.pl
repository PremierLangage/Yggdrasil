extends = /Mathematics/template/mathradio.pl

title = Simplification de valeurs abolues

lang = fr

before ==
var('x')
numsol=1
a,b=list_randint_norep(2,-6,6,[0,1,-1])
expr1=a*x+b
absexpr1=Abs(expr1)
expr2=-a*x-b
expr=refine(abs(x+1)*abs(x-1),Q.is_true(x>-1))
latex_absexpr1=latex(absexpr1)
latex_expr1=latex(expr1)
latex_expr2=latex(expr2)
choices=['$% '+latex_absexpr1+' = '+latex_expr1+' %$','$% '+latex_absexpr1+' = '+latex_expr2+' %$',"Aucune de ces simplifications n'est possible"]
==

text ==
Si $% x > 1 %$, comment se simplifie l'expression $% {{latex_absexpr1}} %$ ?
==

input.1.choices = {{choices}}
input.1.numsol = {{numsol}}


evaluator ==
if answer['1']['eval']==True:
    score=100
else:
    score=0
==



