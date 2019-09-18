extends = /Mathematics/template/mathbasic.pl

input1 =: MathInput

form==
{{input1|component}}
==

title = Produit cartésien

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="sets"
input1.config = keyboards_JSON

lenA,lenB=randitem([[2,3],[3,2],[2,2]])
A=rand_finiteset(lenA,list(range(10)))
B=rand_finiteset(lenB,list(range(10)))
sol=list(ProductSet(A,B))
sol_tex=str(sol)
sol_tex=sol_tex[1:-1]
A_tex=latex(A)
B_tex=latex(B)
==

text == 
Ecrire en extension l'ensemble $! \\{ {{A_tex}} \\} \times \\{ {{B_tex}} \\}. !$
==

evaluator ==
sol=ProductSet(A,B) # because tuples are converted to lists between before and evaluator
score,numerror,feedback=ans_struct_expr(input1.value,sol,"composite")
==

solution ==
La solution est $!\{ {{sol_tex}} \}!$.
==



