extends = /Mathematics/template/mathexpr.pl

title = Simplification d'un produit

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input1.config = keyboards_JSON

denom=101
num=0
while (denom>100) or (num>100):
    a,b,c,d,=list_randitem_norep(4,[10,12,14,15,16,18,20,21,24,25,27,28,30,32,33,35,36,40,42,44,45,48,49,50,52,54,55,56,60,63,64,65,70,72,80,81])
    sol=Rational(a*c,b*d)
    num,denom=fraction(sol)

expr=r"\frac{ %d }{ %d } \times \frac{ %d }{ %d }" % (a,b,c,d)

sol_tex=latex(sol)
==

text ==
Calculer l'expression $% \displaystyle {{expr}} %$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==

evaluator==
score,_,feedback=ans_frac(input1.value,sol)
==

solution==
La solution est $% \displaystyle {{sol_tex}} %$.
==

