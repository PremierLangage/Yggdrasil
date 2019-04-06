@ /utils/sandboxio.py
@ /utils/plrandom.py [plrandom.py]
@ /utils/utilsmath.py [utilsmath.py]
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Title

headbefore ==
from plrandom import rd
rd.seed(seed)
from sympy import sqrt,ln,log,exp,sin,cos,tan
from sympy import isprime,factorint
from sympy import Intersection
from sympy import symbols
from sympy import conjugate
from sympy import Basic, Matrix
from sympy import Rational
from sympy import trace
from utilsmath import *
if 'latexparam' in locals():
    LatexPrinter._settings.update(eval(latexparam))
==

before =

footerbefore ==
_strsympyvar={}
for _namevar in list(locals().keys()):
    if isinstance(locals()[_namevar],(Basic,Matrix)):
        _strsympyvar[_namevar]=str(locals()[_namevar])
==

headevaluator ==
from sympy import Basic, Matrix
from sympy import sympify
from sympy import ln, sqrt
from sympy import isprime
from sympy import trace
from sympy import evaluate
from utilsmath import *
if 'latexparam' in locals():
    LatexPrinter._settings.update(eval(latexparam))
for _namevar in list(_strsympyvar.keys()):
    with evaluate(False):
        locals()[_namevar]=sympify(_strsympyvar[_namevar])
==

evaluator =










