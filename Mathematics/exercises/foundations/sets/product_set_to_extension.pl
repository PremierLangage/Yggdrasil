extends = /model/mathinput.pl

title = Produit cartésien

before ==
lenA, lenB = randitem([[2,3],[3,2],[2,2]])
A = rand_finiteset(lenA,list(range(10)))
B = rand_finiteset(lenB,list(range(10)))
sol = ProductSet(A,B)
==

text == 
Ecrire en extension l'ensemble $! \\{ {{A|lattex}} \\} \times \\{ {{B|latex}} \\}. !$
==

evaluator ==
score,numerror,feedback=ans_struct_expr(input1.value,sol,"composite")
==

solution ==
La solution est $!\{ {{sol_tex}} \}!$.
==




