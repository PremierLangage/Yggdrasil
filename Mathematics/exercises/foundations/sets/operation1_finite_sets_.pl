extends = /model/math/set.pl

title = Opérations sur les ensembles

before ==
A = FiniteSet(*sample(range(10), randint(4, 7)))
B = rand_finiteset(randint(4,7),list(range(10)))
case=randitem(eval(param['cases']))
if case==1:
    expr=r"A \cup B"
    sol=Union(A,B)
elif case==2:
    expr=r"A \cap B"
    sol=Intersection(A,B)
elif case==3:
    expr=r"A \setminus B"
    sol=B.complement(A)
elif case==4:
    expr=r"A \,\triangle\, B"
    sol=B.symmetric_difference(A)
==

text == 
On considère les ensembles suivants :
$$ A= \\{ {{ A|latex }} \\},\ B= \\{ {{ B|latex }} \\}.$$
Déterminer $! {{expr}} !$.
==