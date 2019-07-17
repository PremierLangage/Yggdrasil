extends = /Mathematics/template/mathexpr.pl

title = Transformation d'expressions avec logarithmes

doc ==

Objectif : Transformer des expressions impliquant des logarithmes (naturels)

==

lang = fr


before ==
p,q=list_randint_norep(2,2,5)
formula=randitem(eval(param['formulas']))
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
    expr=randitem(["\ln( %(p)s ) - \ln( %(q)s )","-\ln( %(q)s ) + \ln( %(p)s )"]) % {"p":p,"q":q}
==

text ==
Ecrire $% {{expr}} %$ sous la forme  $% \ln(a)%$, où $%a%$ est un nombre.
==

evaluator==
score,_,feedback=ans_number(answer['1'],sol)

==


wims ==
\text{typerep=numexp}

\text{l=shuffle(2,3,4,5)}
\text{p=\l[1]}
\text{q=\l[2]}

\if{\type=5}{
\text{l1=shuffle(1,randitem(2,3,4))}
\integer{u=\l1[1]}
\integer{v=\l1[2]}
\text{expr=\u*ln(\p)+\v*ln(\q)}
\text{a=simplify(\p^(\u)*\q^(\v))}
}
\if{\type=6}{
\text{a=simplify(\p/\q)}
\text{l1=shuffle(1,randitem(2,3,4))}
\text{l2=shuffle(-1,1)}
\integer{u=\l1[1]*\l2[1]}
\integer{v=\l1[2]*\l2[2]}
\text{expr=\u*ln(\p)+\v*ln(\q)}
\text{a=simplify(\p^(\u)*\q^(\v))}
}
\if{\type=7}{
\text{a=simplify(\p/\q)}
\text{l1=shuffle(2,3,4)}
\integer{u=\l1[1]}
\integer{v=\l1[2]}
\text{expr=\u*ln(\p)+\v*ln(\q)}
\text{a=simplify(\p^(\u)*\q^(\v))}
}
\if{\type=8}{
\text{a=simplify(\p/\q)}
\text{l1=shuffle(2,3,4)}
\text{l2=shuffle(-1,1)}
\integer{u=\l1[1]*\l2[1]}
\integer{v=\l1[2]*\l2[2]}
\text{expr=\u*ln(\p)+\v*ln(\q)}
\text{a=simplify(\p^(\u)*\q^(\v))}
}
\if{\type=9}{
\text{typerep=algexp}
\text{expr=randitem(ln(\p)+\q,\q+ln(\p))}
\text{a=simplify(\p*exp(\q))}
}
\if{\type=10}{
\text{typerep=algexp}
\text{l1=shuffle(-1,1)}
\integer{s1=\l1[1]}
\integer{s2=\l1[2]}
\text{expr=randitem(\s1*ln(\p)+\s2*\q,\s2*\q+\s1*ln(\p))}
\text{a=simplify(exp(\expr))}
}
\if{\type=11}{
\text{typerep=algexp}
\text{u=randint(2..4)}
\text{expr=randitem(\u*ln(\p)+\q,\q+\u*ln(\p))}
\text{a=simplify(\p^(\u)*exp(\q))}
}
\if{\type=12}{
\text{typerep=algexp}
\text{u=randint(2..4)}
\text{l1=shuffle(-1,1)}
\integer{s1=\l1[1]}
\integer{s2=\l1[2]}
\text{expr=randitem(\s1*\u*ln(\p)+\s2*\q,\s2*\q+\s1*\u*ln(\p))}
\text{a=simplify(exp(\expr))}
}



==

