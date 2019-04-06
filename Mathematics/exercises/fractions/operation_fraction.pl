

extends = /template/input/mathexpr.pl

title = Simplification d'une fraction

lang = fr

virtualKeyboards = elementary

before ==
lst=[[1,2],[3,2],[5,2],[1,3],[2,3],[4,3],[5,3]]
f,g=list_randitem_norep(2,lst)
f0,f1=f[0],f[1]
g0,g1=g[0],g[1]
sol=Rational(f0,f1)+Rational(g0,g1)
==

text ==
Simplifier la fraction $%\displaystyle \frac{ {{f0}} }{ {{f1}} } + \frac{ {{g0}} }{ {{g1}} }%$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==

evaluator==
score,_,feedback=ans_frac(answer['1'],sol)
==

