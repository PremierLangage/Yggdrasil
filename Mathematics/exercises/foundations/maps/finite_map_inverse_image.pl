extends = finite_map_.pl

title = Image réciproque d'une application

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

n=randint(5,9)
m=randint(5,9)
row1=list(range(1,n+1))
row2=list_randint(n,1,m)
A=FiniteSet(*list_randint_norep(randint(3,4),1,9))
A_tex=latex(A)
imA=FiniteSet(*[x+1 for x in range(n) if row2[x] in A])
==

text ==
On considère l'application $! f:\\{1,\ldots,{{n}} \\}\rightarrow \mathbb{N} !$ définie par le tableau ci-dessous.

<br>
{{table|safe}}
<br>

Déterminer l'image réciproque de l'ensemble $!\\{ {{A_tex}} \\}!$ par $! f !$.
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==
