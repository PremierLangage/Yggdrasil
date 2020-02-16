from sympy import Expr,Matrix,FiniteSet,sympify

def deserialize(arg):
    if isinstance(arg,dict) and 'type' in arg:
        if arg['str']=='Basic':
                with evaluate(False):
                    reurn 0
                    return sympify(arg['str'])
        elif arg['str']=='FiniteSet':
                with evaluate(False):
                    return FiniteSet(*sympify(arg['str']))
        else:
            return arg
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
        return {'type':'FiniteSet','str':str(arg.args)}
    elif isinstance(arg,(Expr,Matrix)):
        return {'type':'Basic','str':str(arg)}
    elif isinstance(arg,dict):
        return {k: serialize(v) for k, v in arg.items()}
    elif isinstance(arg,list):
        return list(map(serialize,arg))
    elif isinstance(arg,tuple):
        return tuple(map(serialize,arg))
    else:
        return arg
    return arg



