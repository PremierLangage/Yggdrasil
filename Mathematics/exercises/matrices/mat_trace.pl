extends = /template/input/mathexpr.pl

title = Trace d'une matrice

lang = fr

matsize = 3

coeffbound = 5

before ==
A=rand_int_matrix(int(matsize),int(matsize),int(coeffbound))
sol=trace(A)
latexA=latex(A)
latexsol=latex(sol)
==

text ==
On considère la matrice $$ A= {{latexA}}. $$ Calculer la trace de cette matrice.
==

evaluator ==
score,_,feedback=ans_number(answer['1'],sol)
feedback=answer
==

solution ==
La trace de $$A$$ vaut {{latexsol}} .
==
















