extends = /model/basic/hackpage.pl
extends = /model/basic/utils.pl

# Specific keys

attributes = {}

jxgscript ==
==

pointnames = ["A", "B"]

tol = 0.05

# Question and input block

question ==
==

inputblock ==
{{ input|component }}
==

# Before scripts

before_scripts = ["mathimport", "initinput", "before", "process"]

mathimport ==
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval
from sympy import integrate
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import latex
from latex2sympy import latex2sympy
==

initinput ==
from jxginput import JXGVector
input = JXGVector()
==


process ==
input.attributes = attributes
input.evalparam = {'tol': tol}
input.pointnames = pointnames
input.set_script(jxgscript, globals())
==



tplpage =@ /model/tplpage/basicmath.html

evaluator ==
input.sol = sol
score = input.eval()
input.display_feedback()
input.disable()
==


style.jxgcss ==
<style>
.jsxgraph-component {
    width: 400px;
    height: 400px;
    margin: 0 auto;
    border: 1px solid;
}
</style>
==
