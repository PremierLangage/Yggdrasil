from sympy import Expr, Matrix, FiniteSet, sympify, evaluate
from sympy2latex import latex

def deserialize(arg):
    if isinstance(arg,dict) and 'sympy_type' in arg:
        if arg['sympy_type']=='Basic':
                with evaluate(False):
                    return sympify(arg['str'])
        elif arg['sympy_type']=='FiniteSet':
                with evaluate(False):
                    return FiniteSet(*sympify(arg['str']))
    elif isinstance(arg, dict):
        return {k: deserialize(v) for k, v in arg.items()}
    elif isinstance(arg, list):
        return list(map(deserialize,arg))
    elif isinstance(arg, tuple):
        return tuple(map(deserialize,arg))
    else:
        return arg

def serialize(arg):
    if isinstance(arg,FiniteSet):
        return {'sympy_type':'FiniteSet','str':str(arg.args),'latex':latex(arg)}
    elif isinstance(arg,(Expr,Matrix)):
        return {'sympy_type':'Basic','str':str(arg),'latex':latex(arg)}
    elif isinstance(arg,dict):
        return {k: serialize(v) for k, v in arg.items()}
    elif isinstance(arg,list):
        return list(map(serialize,arg))
    elif isinstance(arg,tuple):
        return tuple(map(serialize,arg))
    else:
        return arg




