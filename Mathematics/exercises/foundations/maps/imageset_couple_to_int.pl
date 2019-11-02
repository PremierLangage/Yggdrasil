extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
n,m=list_randitem_norep(2,symbols("n,m,p,q,r"))
expr=randitem([n+m,n**2+m,n+m**2])
nn=latex(n)
mm=latex(m)
expr_tex=latex(expr)
A=FiniteSet((1,3),(4,5))
f = Lambda ( (n,m) , expr)
imA=FiniteSet(*[f(*x) for x in A])
A_tex=latex(A)
==

text ==
On considère la fonction $! f : \mathbb{Z} \rightarrow \mathbb{Z} \times \mathbb{Z} !$ telle que
$$f({{nn}},{{mm}})= {{expr_tex}}$$
Déterminer $! f(\\{ {{A_tex}} \\}) !$, l'image directe de 
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==





