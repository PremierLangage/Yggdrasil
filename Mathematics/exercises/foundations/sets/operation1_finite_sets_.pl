extends = /Mathematics/template/mathbasic.pl

input1 =: MathInput

form==
{{input1|component}}
==


title = Opérations sur les ensembles

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="sets"
input1.config = keyboards_JSON

A=rand_finiteset(randint(4,7),list(range(10)))
B=rand_finiteset(randint(4,7),list(range(10)))
case=randitem(eval(param['cases']))
if case==1:
    expr=r"A \cup B"
    sol=Union(A,B)
elif case==2:
    expr=r"A \cap B"
    sol=Intersection(A,B)
elif case==3:
    expr=r"A \setminus B"
    sol=B.complement(A)
elif case==4:
    expr=r"A \,\triangle\, B"
    sol=B.symmetric_difference(A)

A_tex=latex(A)
B_tex=latex(B)
sol_tex=latex(sol)
sol=list(sol)
==

text == 
On considère les ensembles suivants :
$$ A= \\{ {{A_tex}} \\},\ B= \\{ {{B_tex}} \\}.$$
Déterminer $! {{expr}} !$.
==

evaluator ==
score,_,feedback=ans_struct_expr(input1.value,sol,"set")
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==


