extends = /Mathematics/template/mathexpr.pl

title = Intersection d'ensembles finis

lang = fr

virtualKeyboards =sets

before ==
A=rand_finiteset(5,range(10))
B=rand_finiteset(5,range(10))
sol=Intersection(A,B)
latexA=latex(A)
latexB=latex(B)
latexsol=latex(sol)
==

text == 
On considère les intervalles $% A= {{latexA}} %$ et $% B={{latexB}}.%$ Déterminer $% A\cap B%$.
==

evaluator ==
score,numerror,feedback=ans_finiteset(answer['1'],sol)
==

