extends = /model/mathmultistep.pl

title = Lecture des coefficients d'une matrice

nbstep % 3

before ==
coeff =[]
matrices = []
inputs = []
sol = []
for k in range(nbstep):
    inputs.append(Input())
    n = randint(4, 6)
    m = randint(4, 6)
    i = randint(1, n)
    j = randint(1, m)
    matrices.append(rand_int_matrix(n, m, 9))
    sol.append(matrices[k][i,j])
    coeff.append(r"a_{ %s , %s}" % (i,j))
==

textstep ==
**Question {{step + 1}}.** On considère la matrice.
$$ A = \left( {{matrices[step].latex}} \right).$$
Que vaut $! {{ coeff[step] }} !$ ?
==

formstep ==
{{ inputs[step]|component }}
==

evaluatorstep ==
try:
    ans = int(inputs[step].value)
    if ans == sol[step]:
        score = 100
        feedback = ""
    else:
        score = 0
        feedback = str(sol[step])
except:
    score = 0
    feedback = str(sol[step])

inputs[step].disbaled = True
==

