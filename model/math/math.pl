@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py

@ /model/math/jinja_math.py [jinja_env.py]
@ /model/math/json_math.py [json_encoder.py]
@ /utils/components/mathinput/mathinput.py
@ /utils/components/mathinput/mathinput.html
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py
@ /utils/graphics/plmpl.py
@ /utils/plrandom.py

before_scripts % ["mathimport", "headerbefore", "before", "footerbefore", "process"]

latexsettings.ln_notation % true
latexsettings.inv_trig_style = full

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

style.basic =@ /model/basic/basic.css.html

oldstyle.basic == #|css|
<style>
.icon-check-after p::after {
    font-family: "Font Awesome 5 Free";
    color: #006400;
    margin-left: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-after p::after {
    font-family: "Font Awesome 5 Free";
    color: #dc3545;
    margin-left: 1em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}

.icon-check-before p::before {
    font-family: "Font Awesome 5 Free";
    color: #006400;
    margin-right: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-before p::before {
    font-family: "Font Awesome 5 Free";
    color: #dc3545;
    margin-right: 1em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}

.btn-audio::before {
    font-family: "Font Awesome 5 Free";
    color: white;
    content: "\f028";
    vertical-align: middle;
    font-weight: 900;
}

.error-text-unit {
    background-color: #f2dede;
    color: #a94442;
    text-decoration: line-through #a94442;
}

.success-text-unit {
    background-color: #dff0d8;
    color: #3c763d;
}

.missed-text-unit {
    color: #3c763d;
    text-decoration: underline wavy #3c763d;
}


</style>
==

# HACK : Ce script JS permet de modifier la liste des boutons de contrôle.

