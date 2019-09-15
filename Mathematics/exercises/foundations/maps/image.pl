extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
n,m=list_randitem_norep(2,symbols("n,m,p,q,r"))
expr=n+m
nn=latex(n)
mm=latex(m)
expr_tex=latex(expr)
A=FiniteSet(1,4,5)
f = lambda x: x +1
sol = ImageSet(Lambda(n,n+1),A)

A_tex=latex(A)
==

text ==
{{sol}}
On considère la fonction $! f : \mathbb{Z} \rightarrow \mathbb{Z} \times \mathbb{Z} !$ telle que
$$f({{nn}},{{mm}})= {{expr_tex}}$$
Déterminer $$ f(\\{ {{A_tex}} \\}) $$
==

evaluator==
score,numerror,feedback=ans_tuple_expr(answer['1'],sol)
==




