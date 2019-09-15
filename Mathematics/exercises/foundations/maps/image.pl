extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
n,m=list_randitem_norep(2,symbols("n,m,p,q,r"))

expr=a*randitem([n,(n)^2)+b*m])
==

text ==
On considère la fonction $$ f : \mathbb{N} \rightarrow \mathbb{N} \times \mathbb{N} $$ telle que
$$f(n)=\left(\frac{n^2}{2},2n+1\right)$$
Calculer $$ f({{n}}) $$
==

evaluator==
score,numerror,feedback=ans_tuple_expr(answer['1'],sol)
==




