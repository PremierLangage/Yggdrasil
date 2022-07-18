# Author : D. Doyen
# Last update : 09/01/21
# Keywords : linear systems

extends = /model/math/radio.pl

title = Nombre de solutions d'un sytème

extends = /model/basic/basic.pl

before_scripts = ["mathimport", "before"]


mathimport == #|py|
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln, atan, acos, asin
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, factor, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval, Matrix
from sympy import Sum, Limit
from sympy import diff, integrate
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import CustomLatexPrinter
latex = CustomLatexPrinter(latexsettings).doprint
from latex2sympy import latex2sympy
from randsympy import randpoly
from randsympy import randmat, randmat_invertible, randmat_fullrank, randmat_givenrank
==

tplpage =@ /model/tplpage/basicmath.html

before ==
from radio import Radio

from sympy2latex import latex_linsys
from sympy import linsolve, EmptySet

def generate_data():
    n = 2
    vec = [randint(-2, 2) for _ in range(n)]
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
            perturbation = [0, choice([-1,1])]
            shuffle(perturbation)
            B = A*Matrix(vec) + Matrix(perturbation)
            if linsolve((A, B)) == EmptySet:
                break
    system = latex_linsys(A, B)
    return indexsol, system

inputs = [Radio() for _ in range(3)]

systems = []
for i in range(3):
    indexsol, system = generate_data()
    systems.append(system)
    inputs[i].set_items(["Une unique solution", "Une infinité de solutions", "Aucune solution"])
    inputs[i].set_sol(indexsol)

lstvar = "x, y"
==

question ==
Combien de solutions possède chacun des systèmes suivants ?
==

solution ==

==

inputblock ==
{% for i in range(3) %}
<div>
{{ i+1 }}. $$ {{ systems[i] }} $$
{{ inputs[i]|component }}
</div>
{% endfor %}
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
    score = sum(scores)//len(scores)

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
