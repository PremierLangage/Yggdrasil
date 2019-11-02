extends = /Mathematics/template/mathinput.pl

title = Image d'une application

lang = fr

before ==
n,m=list_randitem_norep(2,symbols("n,m,p,q,r"))
expr=randitem([n+m,n**2+m,n+m**2])
nn=latex(n)
mm=latex(m)
expr_tex=latex(expr)
f = Lambda ( (n,m) , expr)

E = [(x,y) for x in range(-3,4) for y in range(-3,4)]
A=FiniteSet(*list_randitem_norep(3,E))
imA=FiniteSet(*[f(*x) for x in A])
A_tex=latex(A)
==

text ==
On considère la fonction $! f : \mathbb{Z} \times \mathbb{Z} \rightarrow \mathbb{Z} !$ telle que
$$f({{nn}},{{mm}})= {{expr_tex}}$$
Déterminer $! f(\\{ {{A_tex}} \\}). !$
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==





