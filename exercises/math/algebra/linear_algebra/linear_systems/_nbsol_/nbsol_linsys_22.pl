# Author : D. Doyen
# Last update : 09/01/21
# Keywords : linear systems

extends = /model/math/radio.pl

title = Nombre de solutions d'un sytème

before ==
from radio import Radio

from sympy2latex import latex_linsys
n = 2
vec = [randint(-2, 2) for _ in range(n)]

def generate_data():
    indexsol = randint(0, 2)
    if indexsol == 0:
        A = randmat_givenrank(n, n, n, magnitude=2)
        B = A*Matrix(vec)
    elif indexsol == 1:
        A = randmat_givenrank(n, n, n-1, magnitude=2)
        B = A*Matrix(vec)
    else:
        A = randmat_givenrank(n, n, n-1, magnitude=2)
        while True:
            perturbation = [0, 0, choice([-1,1])]
            shuffle(perturbation)
            B = A*Matrix(vec) + Matrix(perturbation)
            if linsolve((A, B)) == EmptySet:
                break
    system = latex_linsys(A, B)
    return indexsol, system

inputs = [Radio() for _ in range(3)]

for i in range(3):
    indexsol, system = generate_data()
    inputs[i].set_items(["Une unique solution", "Une infinité de solutions", "Aucune solution"])
    inputs[i].set_sol(indexsol)


system = latex_linsys(A, B)
lstvar = "x, y"
==



evaluator == #|py|
# Evaluate all input fields
for input in inputs:
    input.eval()

# Compute score   
scores = [input.score for input in inputs]
if -1 in scores:
    score = -1
else:
    score = sum(lst)//len(lst)

# Display feedback
if score != -1:
    for input in inputs:
        input.display_feedback()
else:
    for input in inputs:
        if input.score == -1:
            input.display_feedback()
        else:
            input.hide_feedback()

# Disable input fields
if score != -1:
    for input in inputs:
        input.disable()
==
