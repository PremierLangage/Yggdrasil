#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from sandboxio import get_context
from components import Component

try:
    from serialize import serialize
except ImportError:
    def serialize(arg):
        return arg

try:
    from namespace import namespace
except ImportError:
    namespace = {}

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
    dic = {**namespace, **dic}
    
    if 'before' in dic:
        dic['StopBeforeExec'] = StopBeforeExec
        exec(add_try_clause(dic['before'], StopBeforeExec), dic)
        exec("", namespace)
        for key in namespace:
            if key in dic and dic[key] == namespace[key]:
                del dic[key]


    # sync components defined inside a list
    for k in list(dic.keys()):
        if isinstance(dic[k],list):
            for e in dic[k]:
                if isinstance(e, Component):
                    dic[e.id] = e

    if 'buttons' not in dic:
        dic['buttons'] = ["submit","reroll"]

    if 'maxattempt' not in dic:
        dic['maxattempt'] = 1

    dic['attempt']=1
    

    print(dic, file=sys.stderr)

    with open(output_json, "w+") as f:
        f.write("{")
        f.write(",".join([jsonpickle.encode(v, unpicklable=False) for v in dic.values()]))
        f.write("}")

    with open(output_json) as f:
        print(f.read(), file=sys.stder)

    sys.exit(0)






