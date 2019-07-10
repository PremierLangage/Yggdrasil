extends = /Mathematics/template/mathexpr.pl

title = Intersection d'ensembles finis

lang = fr

before ==
A=rand_finiteset(5,list(range(10)))
B=rand_finiteset(5,list(range(10)))
sol=Intersection(A,B)
latexA=latex(A)
latexB=latex(B)
latexsol=latex(sol)
==

text == 
On considère les ensembles suivants :
$$ A= {{latexA}},\ B={{latexB}}.$$
Déterminer $% A\cap B%$.
==

input.1.virtualKeyboards =sets

evaluator ==
score,numerror,feedback=ans_finiteset(answer['1'],sol)
==

