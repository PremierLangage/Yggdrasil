extends = /Mathematics/template/mathinput.pl

title = Antécédent

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

n,m=list_randitem_norep(2,symbols("n,m,p,q,r"))
nn=latex(n)
mm=latex(m)
expr=randint(-3,3,[0])*(n+randint(-2,2))*(m+randint(-2,2))
expr_tex=latex(expr)
f = Lambda ( (n,m) , expr)
y=f(1,2)
E = [(x,y) for x in range(-3,4) for y in range(-3,4)]
A=FiniteSet(*list_randitem_norep(3,E))
imA=FiniteSet(*[f(*x) for x in A])
A_tex=latex(A)
imA_tex=latex(imA)
==

text ==
On considère la fonction $! f : {{E1_tex}} \times {{E2_tex}} \rightarrow \mathbb{Z} !$ telle que
$$f({{nn}},{{mm}})= {{expr_tex}}$$
Déterminer un antécédent de $! {{y}} !$ par  $! f !$
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==

solution ==
La solution est $! {{imA_tex}} !$
==

