extends = /template/input/mathexpr.pl

title = Simplification d'une fraction

lang = fr

virtualKeyboards = elementary

before ==
lst=[[2,1],[3,1],[4,1],[5,1],[6,1],[7,1],[8,1],[9,1],[3,2],[4,3],[5,4],[5,3],[5,2],[6,5],[7,6],[7,5],[7,4],[7,3],[7,2],[8,7],[8,5],[8,3]]
f=randitem(lst)
rd.shuffle(f)
c=randint(2,6)
a,b=c*f[0],c*f[1]
sol=Rational(a,b)
==

text ==
Simplifier la fraction $%\displaystyle \frac{ {{a}} }{ {{b}} }%$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==

evaluator==
score,_,feedback=ans_frac(answer['1'],sol,lang)
==


