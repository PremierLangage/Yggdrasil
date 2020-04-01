extends = /model/mathmultistep.pl

title = Relation de dépendance entre polynômes

nbstep % 3

before ==
for i in range(nbstep):

    inputs.append(Input())
    inputs[i].type = "number"
    n = randint(4, 6)
    m = randint(4, 6)
    i.append(randint(1, n))
    j.append(randint(1, m))
    matrices.append(rand_int_matrix(n, m, 9))
==

textstep ==
**Question 1**. On considère la matrice.
$$ A = \left( {{matrices[step]}}= \right).$$
==

formstep ==
{{ inputs[step]|component }}
==

evaluatorstep ==
feedback = ""
if inputs[step].value == sol[step]:
    score = 100
else:
    score = 0
==

