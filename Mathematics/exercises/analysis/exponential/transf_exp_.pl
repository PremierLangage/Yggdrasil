extends = /model/math/expr.pl

# Transformer des expressions avec exponentielle

before ==
p, q = sample([-5,-4,-3,-2,2,3,4,5], 2)
formula=choice(eval(param['formulas']))
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
Ecrire $! \displaystyle {{expr}} !$ sous la forme  $! \exp(a) !$, où $! a !$ est un nombre.
==

embed ==
\exp{ # }
==





wims ==

\if{\type=55}{
\integer{u=randitem(-1,1)*randint(2..4)}
\text{expr=randitem((exp(\p))^{\u} \times exp(\q),exp(\q) \times (exp(\p))^{\u})}
\text{a=simplify((\p)*(\u) +\q)}
}
\if{\type=56}{
\integer{u=randitem(-1,1)*randint(2..4)}
\if{randitem(1,2)=1}{
\text{expr=\frac{(exp(\p))^{\u}}{exp(\q)}}
\text{a=simplify(\p*(\u)-(\q))}
}{
\text{expr=\frac{exp(\q)}{(exp(\p))^{\u}}}
\text{a=simplify(\q-(\p)*(\u))}
}
}
\if{\type=57}{
\text{l1=shuffle(2,3,4)}
\integer{u=randitem(-1,1)*\l1[1]}
\integer{v=randitem(-1,1)*\l1[2]}
\text{expr=(exp(\p))^{\u} \times (exp(\q))^{\v}}
\text{a=simplify((\p)*(\u)+(\q)*(\v))}
}
\if{\type=58}{
\text{l1=shuffle(2,3,4)}
\integer{u=randitem(-1,1)*\l1[1]}
\integer{v=randitem(-1,1)*\l1[2]}
\text{expr=\frac{(exp(\p))^{\u}}{(exp(\q))^{\v}}}
\text{a=simplify((\p)*(\u)-(\q)*(\v))}
}
\if{\type=59}{
\text{typerep=algexp}
\integer{q=abs(\q)}
\text{expr=randitem(exp(\p)\times \q,\q \times exp(\p))}
\text{a=simplify(\p+ln(\q))}
}
\if{\type=60}{
\text{typerep=algexp}
\integer{q=abs(\q)}
\if{randitem(1,2)=1}{
\text{expr=\frac{exp(\p)}{\q}}
\text{a=simplify(\p-ln(\q))}
}{
\text{expr=\frac{\q}{exp(\p)}}
\text{a=simplify(ln(\q)-\p)}
}
}
\if{\type=61}{
\text{typerep=algexp}
\integer{q=abs(\q)}
\integer{u=randitem(-1,1)*randint(2..4)}
\text{expr=randitem(exp(\p)^{\u}\times \q,\q \times exp(\p)^{\u})}
\text{a=simplify((\p)*(\u)+ln(\q))}
}
\if{\type=62}{
\text{typerep=algexp}
\integer{q=abs(\q)}
\integer{u=randitem(-1,1)*randint(2..4)}
\if{randitem(1,2)=1}{
\text{expr=\frac{exp(\p)^{\u}}{\q}}
\text{a=simplify((\p)*(\u)-ln(\q))}
}{
\text{expr=\frac{\q}{exp(\p)^{\u}}}
\text{a=simplify(ln(\q)-(\p)*(\u))}
}
}

==


