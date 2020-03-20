#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from sandboxio import get_context
from components import Component
import uuid

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

    for key in dic:
        dic[key]=serialize(dic[key])

    newcomp = []
    for key in dic:
        if isinstance(dic[key], list):
            for i in range(len(dic[key])):
                item = dic[key][i]
                if isinstance(item, Component):
                    name = "c" + uuid.uuid4().hex
                    newcomp.append((name, item))
                    dic[key][i] = {"cid": item.cid, "name": name, "selector": item.selector}

    for name, comp in newcomp:
        dic[name] = comp

    dic['step'] = -1
    dic['text'] = dic['intro']               
    dic['final'] = ""
    dic['scores'] = []

    if 'buttons' not in dic:
        dic['buttons'] = ["submit"]


    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))

    sys.exit(0)



