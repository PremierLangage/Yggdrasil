extends = /model/math/expr.pl

title = Transformation d'expressions avec exponentielles

before ==
p, q = sample([-5,-4,-3,-2,2,3,4,5], 2)
formula=choice(param['formulas'])
if formula=="(exp(p))^u":
    u=randint(2,4)
    sol=p*u
    expr="(\exp( %d ))^{ %d }" % (p,u)
elif formula=="1/(exp(p))^u":
    u=randint(-4,-2)
    sol=-p*u
    expr=r"\frac{1}{(\exp( %d ))^{ %d }}" % (p,u)
elif formula=="exp(p)*exp(q)":
    sol=p+q
    expr=r"\exp( %d ) \times \exp( %d )" % (p,q)
elif formula=="exp(p)/exp(q)":
    sol=p-q
    expr=r"\frac{\exp( %d )}{\exp( %d )}" % (p,q)
==

question ==
Ecrire $%\displaystyle {{expr}} %$ sous la forme  $! \exp(a) !$, où $! a !$ est un nombre.
==

embed ==
\exp{ # }
==







