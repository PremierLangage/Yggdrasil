# Model for a single math input field
# with an evaluation as an expression

extends = /model/math/input0.pl

# Specific keys

input_type = "numeric"
tol = 0.1
diffmeasure = "RelError"

evalparam ==
from sympy import sympify
input.evalparam = {'tol':tol, 'diffmeasure':diffmeasure}
==

