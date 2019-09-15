extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
n,m=list_randitem_norep(2,symbols("n,m,p,q,r"))
expr=n+m
nn=latex(n)
mm=latex(m)
expr_tex=latex(expr)
A=FiniteSet((1,1),(1,2))
==

text ==
On considère la fonction $! f : \mathbb{Z} \rightarrow \mathbb{Z} \times \mathbb{Z} !$ telle que
$$f({{nn}},{{mm}})= {{expr_tex}}$$
Déterminer $$ f({{A}}) $$
==

evaluator==
score,numerror,feedback=ans_tuple_expr(answer['1'],sol)
==




