extends = /model/mathinput.pl


title = Opérations sur les ensembles

input.virtualKeyboards = sets

before ==
A=rand_finiteset(randint(4,7),list(range(10)))
B=rand_finiteset(randint(4,7),list(range(10)))
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

evaluator ==
score, error = eval_set(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! { {{sol|latex}} } !$.
==






