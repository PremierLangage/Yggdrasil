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

A=rand_finiteset(randint(3,7),list(range(10)))
B=rand_finiteset(randint(3,7),list(range(10)))
C=rand_finiteset(randint(3,7),list(range(10)))
case=randitem(eval(param['cases']))
if case==1:
    expr=r"(A \cap B) \cup C"
    sol=Union(Intersection(A,B),C)
elif case==2:
    expr=r"(A \cup B) \cap C"
    sol=Intersection(Union(A,B),C)
elif case==3:
    expr=r"A \cap (B \cup C)"
    sol=Intersection(Union(B,C),A)
elif case==4:
    expr=r"A \cup (B \cap C)"
    sol=Union(Intersection(B,C),A)

elif case==5:
    expr=r"(A \cup B) \setminus C"
    sol=C.complement(Union(A,B))
elif case==6:
    expr=r"(A \setminus B) \cup C"
    sol=Union(C,B.complement(A))
elif case==7:
    expr=r"A \cup (B \setminus C)"
    sol=Union(A,C.complement(B))
elif case==8:
    expr=r"A \setminus (B \cup C)"
    sol=Union(B,C).complement(A)

elif case==9:
    expr=r"(A \cap B) \setminus C"
    sol=C.complement(Intersection(A,B))
elif case==10:
    expr=r"(A \setminus B) \cap C"
    sol=Intersection(C,B.complement(A))
elif case==11:
    expr=r"A \cap (B \setminus C)"
    sol=Intersection(A,C.complement(B))
elif case==12:
    expr=r"A \setminus (B \cap C)"
    sol=Intersection(B,C).complement(A)


A_tex=latex(A)
B_tex=latex(B)
C_tex=latex(C)
sol_tex=latex(sol)
sol=list(sol)
==

text == 
On considère les ensembles suivants :
$$ A= \\{ {{A_tex}} \\},\ B= \\{ {{B_tex}} \\},\ C= \\{ {{C_tex}} \\}.$$
Déterminer $! {{expr}} !$.
==

evaluator ==
score,_,feedback=ans_struct_expr(input1.value,sol,"set")
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==




