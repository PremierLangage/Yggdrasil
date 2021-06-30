@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py

@ /model/math/jinja_math.py [jinja_env.py]
@ /model/math/json_math.py [json_encoder.py]
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py
@ /utils/sympy/mplsympy.py
@ /utils/plrandom.py

before_scripts % ["mathimport", "headerbefore", "before", "footerbefore", "process"]

mathimport ==
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import latex
from latex2sympy import latex2sympy
==

style.svg ==
<style>

.question p {
    font-size: 16px;
    font-weight: 500;
}

.question {
    font-size: 16px;
    font-weight: 500;
}

.img-container {
    width: 60%;
    margin: auto;
}

@media screen and (max-width: 768px) { /* css appliqué sur les tablettes */
    .img-container {
        width: 80%;
        margin: auto;
    }
}

@media screen and (max-width: 576px) { /* css appliqué sur les téléphones */
    .img-container {
        width: 100%;
        margin: auto;
    }
}
</style>
==

# HACK : Ce script JS permet de modifier la liste des boutons de contrôle.

