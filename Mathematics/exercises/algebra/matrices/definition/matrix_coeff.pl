extends = /model/mathmultistep.pl

title = Relation de dépendance entre polynômes

nbstep % 3

before ==
coeff =[]
matrices = []
inputs = []
sol = []
for k in range(nbstep):

    inputs.append(Input())
    inputs[k].type = "number"
    n = randint(4, 6)
    m = randint(4, 6)
    i = randint(1, n))
    j = randint(1, m))
    matrices.append(rand_int_matrix(n, m, 9))
    sol.append(matrices[k][i][j])
    coeff.append(r"a_{ %s , %s}" % (i,j))
==

textstep ==
**Question 1**. On considère la matrice.
$$ A = \left( {{matrices[step]}}= \right).$$
Que vaut {{ a_{ {{i[step], {{j[step]}}
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

