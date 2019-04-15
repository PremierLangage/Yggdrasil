@ /utils/sandboxio.py
@ /utils/plrandom.py [plrandom.py]
@ /utils/utilsmath.py [utilsmath.py]
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

settings.allow_reroll = true
settings.reroll_threshold = 0

title = Title

headbefore ==
from plrandom import rd
rd.seed(seed)
from sympy import sqrt,ln,log,exp,sin,cos,tan
from sympy import pi
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

footerbefore ==
def _sympy_to_str(arg):
# returns arg with sympy items converted to strings, otherwise they don't go through 
# to the evaluator tag.
# applies recursively to items if arg is a list, dict, tuple
	if isinstance(arg,(Basic,Matrix)):
		return '_converted_'+str(arg)
    elif isinstance(arg, dict):
        return {k: _sympy_to_str(v) for k, v in arg.items()}
    elif isinstance(arg, list):
        return list(map(_sympy_to_str,arg))
    elif isinstance(arg, tuple):
        return tuple(map(_sympy_to_str,arg))
    else : 
        return arg

_strsympyvar={}
_k = None
_v = None
for _k,_v in locals().items():
    if isinstance(_v,(Basic,Matrix, list, tuple, dict)):
        _strsympyvar[_k]=_sympy_to_str(_v)
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


def _str_to_sympy(arg):
# inverse of _sympy_to_str in footerbefore.
	if isinstance(arg,str):
        if arg[:11] == '_converted_':
            with evaluate(False):
		        return sympify(arg[11:])
        else:
            return arg
    elif isinstance(arg, dict):
        return {k: _str_to_sympy(v) for k, v in arg.items()}
    elif isinstance(arg, list):
        return list(map(_str_to_sympy,arg))
    elif isinstance(arg, tuple):
        return tuple(map(_str_to_sympy,arg))
    else : return arg

#for _k,_v in _strsympyvar.items():
#   locals()[_k]=_str_to_sympy(_v)

==







