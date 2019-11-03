extends = finite_map_.pl

title = Image réciproque d'une application

drag1 =: DragDrop
drag1.content = et

before ==




n=randint(5,9)
m=randint(5,9)
row1=list(range(1,n+1))
row2=list_randint(n,1,m)
A=FiniteSet(*list_randint_norep(randint(3,4),1,9))
A_tex=latex(A)
imA=FiniteSet(*[x+1 for x in range(n) if row2[x] in A])
==

text ==
{{drag1}}
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==

solution ==
La solution est $! {{imA_tex}} !$
==

