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

latexsettings.ln_notation % true

mathimport ==
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import latex
from latex2sympy import latex2sympy
==


style.basic == #|css|
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

.highlight-state {
    color: var(--brand-color-primary);
    background-color: #cce5ff;
}

.question p {
    font-size: 16px;
    font-weight: 500;
}

.question {
    font-size: 16px;
    font-weight: 500;
}

hr.divide {
  background-color: lightgray;
  height: 0.5px;
  border: 0;
}


.img {
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    height: auto;
    margin-left: auto;
    margin-right:auto;
}

.img-60 {
    max-width: 60%;
}
.img-50 {
    max-width: 50%;
}
.img-40 {
    max-width: 40%;
}

@media screen and (max-width: 768px) { /* css appliqué sur les tablettes */
    .img-60 {
        max-width: 80%;
    }
    .img-50 {
        max-width: 70%;
    }
    .img-40 {
        max-width: 60%;
    }
}

@media screen and (max-width: 576px) { /* css appliqué sur les téléphones */
    .img-60 {
        max-width: 100%;
    }
    .img-50 {
        max-width: 90%;
    }
    .img-40 {
        max-width: 80%;
    }
}


@media screen and (max-width: 768px) { /* css appliqué sur les tablettes */
    .img-40 {
        max-width: 60%;
        height: auto;
        margin: auto;
    }
}

@media screen and (max-width: 576px) { /* css appliqué sur les téléphones */
    .img-40 {
        max-width: 80%;
        height: auto;
        margin: auto;
    }
}
</style>
==

# HACK : Ce script JS permet de modifier la liste des boutons de contrôle.

