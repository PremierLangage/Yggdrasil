# Author: D. Doyen
# Tags: exponential
# Transformer des expressions avec logarithme
# 19/7/2021

extends = /model/math/expr.pl

before ==
p, q = sample([-5,-4,-3,-2,2,3,4,5], 2)
formula=choice(eval(param['formulas']))
if formula=="u*ln(p)":
    u=randint(2,4)
    sol=p**u
    expr="%d \ln(%d)" % (u,p)
elif formula=="-u*ln(p)":
    u=randint(-4,-2)
    sol=p**u
    expr="%d \ln(%d)" % (u,p)
elif formula=="ln(p)+ln(q)":
    sol=p*q
    expr="\ln(%d) + \ln(%d)" % (p,q)
elif formula=="ln(p)-ln(q)":
    sol=p/q
    expr=choice(["\ln( %(p)s ) - \ln( %(q)s )","-\ln( %(q)s ) + \ln( %(p)s )"]) % {"p":p,"q":q}
elif formula=="u*ln(p)+ln(q)":
    u,v=sample([1,randint(2,4)],2)
    sol=p**u*q
    expr="%d \ln(%d)+\ln(%d)" % (u,p,q)
elif formula=="u*ln(p)-ln(q)":
    s1,s2=sample(2,[-1,1])
    u,v=sample([s1*1,s2*randint(2,4)], 2)
    sol=p**u*q**v
    expr=latex(u*ln(p)+v*ln(q))
elif formula=="u*ln(p)+vln(q)":
    u,v=sampleint(2, 4, 2)
    sol=p**u*q**v
    expr="%d \ln(%d)+%d \ln(%d)" % (u,p,v,q)
elif formula=="u*ln(p)-vln(q)":
    s1,s2=sample(2,[-1,1])
    u,v=sampleint(2, 4, 2)
    u,v=s1*u,s2*v
    sol=p**u*q**v
    expr="%d \ln(%d)+%d \ln(%d)" % (u,p,v,q)
==

question ==
Ecrire l'expression suivante sous la forme  $% \ln(a)%$, où $%a%$ est un nombre.
==

embed ==
\ln \left( # \right)
==
wims ==


\if{\type=9}{
\text{typerep=algexp}
\text{expr=choice(ln(\p)+\q,\q+ln(\p))}
\text{a=simplify(\p*exp(\q))}
}
\if{\type=10}{
\text{typerep=algexp}
\text{l1=shuffle(-1,1)}
\integer{s1=\l1[1]}
\integer{s2=\l1[2]}
\text{expr=choice(\s1*ln(\p)+\s2*\q,\s2*\q+\s1*ln(\p))}
\text{a=simplify(exp(\expr))}
}
\if{\type=11}{
\text{typerep=algexp}
\text{u=randint(2..4)}
\text{expr=choice(\u*ln(\p)+\q,\q+\u*ln(\p))}
\text{a=simplify(\p^(\u)*exp(\q))}
}
\if{\type=12}{
\text{typerep=algexp}
\text{u=randint(2..4)}
\text{l1=shuffle(-1,1)}
\integer{s1=\l1[1]}
\integer{s2=\l1[2]}
\text{expr=choice(\s1*\u*ln(\p)+\s2*\q,\s2*\q+\s1*\u*ln(\p))}
\text{a=simplify(exp(\expr))}
}



==






