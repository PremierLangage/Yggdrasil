extends = /Mathematics/template/mathexpr.pl

title = Rang d'un système linéaire 3x3

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
Quel est le rang de la matrice suivante ?
$$ A= {{latexA}}$$
==

evaluator ==
score,_,feedback=ans_number(answer['1'],sol)
feedback=answer
==






