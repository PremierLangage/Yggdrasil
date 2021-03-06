#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from sandboxio import get_context
from sympy import *
from random import random as rd
#rd.seed(seed)
from utilsmath import *
with open('keyboards.JSON') as json_file:  
    keyboards_JSON = json.load(json_file)


def sympy_to_str(arg):
    if isinstance(arg,FiniteSet):
        return "_setconverted_"+str(arg.args)
    elif isinstance(arg,(Expr,Matrix)):
        return "_converted_"+str(arg)
    elif isinstance(arg,dict):
        return {k: sympy_to_str(v) for k, v in arg.items()}
    elif isinstance(arg,list):
        return list(map(sympy_to_str,arg))
    elif isinstance(arg,tuple):
        return tuple(map(sympy_to_str,arg))
    else:
        return arg
    return arg



class StopBeforeExec(Exception):
    pass


def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n    ...\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    output_json = sys.argv[2]
    
    dic = get_context()

    if 'before' in dic:
        dic = dict(list(globals().items()) + list(dic.items()))
        if 'latexparam' in dic:
            LatexPrinter._settings.update(eval(dic['latexparam']))
        dic['StopBeforeExec'] = StopBeforeExec
        exec(add_try_clause(dic['before'], StopBeforeExec), dic)
        exec("", globals().copy())
        for key in globals().copy():
            if key in dic and dic[key] == globals()[key]:
                del dic[key]
        for key in dic:
            dic[key]=sympy_to_str(dic[key])
    else:
        print(("Builder 'before' need a script declared in the key 'before'. "
               + "See documentation related to this builder."),
              file = sys.stderr)
        sys.exit(1)
    
    dic['nbattempt']=0

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)









