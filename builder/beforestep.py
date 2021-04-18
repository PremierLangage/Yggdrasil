#!/usr/bin/env python3
# coding: utf-8
import sys, json, jsonpickle
from sandboxio import get_context
from components import Component
import uuid

# Load the custom serialization function
try:
    from serialize import serialize
except ImportError:
    def serialize(arg):
        return arg

# Load the custom namespace
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

# HACK for components in lists
# components in lists are duplicated outside the lists
# and replaced by dictionaries inside the lists
def aux_component(dic):
    newcomp = []
    for key in dic:
        if isinstance(dic[key], list):
            for i in range(len(dic[key])):
                item = dic[key][i]
                if isinstance(item, Component):
                    name = "c" + uuid.uuid4().hex
                    newcomp.append((name, item))
                    dic[key][i] = {"cid": item.cid, "name": name, "selector": item.selector}
                else:
                    break

    for name, comp in newcomp:
        dic[name] = comp

if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    output_json = sys.argv[2]
    
    # JSON context is converted into a python dictionary and stored in dic
    dic = get_context()

    # the content of namespace is added to dic
    dic = {**namespace, **dic}

    if 'buildquestions' in dic:
        # execute the script in before key with dic as globals
        exec(dic['buildquestions'], dic)


    if 'before' in dic:

        # execute the script in before key with dic as globals
        dic['StopBeforeExec'] = StopBeforeExec
        exec(add_try_clause(dic['before'], StopBeforeExec), dic)
        
        # clean dic from namespace elements
        exec("", namespace)
        for key in namespace:
            if key in dic and dic[key] == namespace[key]:
                del dic[key]

    # custom serialization is applied
    for key in dic:
        dic[key]=serialize(dic[key])

    # HACK for components in lists
    aux_component(dic)

    dic['step'] = -1
    dic['text'] = dic['intro']               
    dic['all_steps'] = ""
    dic['scores'] = []

    if 'settings' not in dic:
        dic['settings'] = {}

    if 'internals' not in dic:
        dic['internals'] = {}

    if 'scenario' in dic['settings']:
        dic['internals']['buttons'] = ["submit"]
    else:
        dic['internals']['buttons'] = ["submit"]

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))

    sys.exit(0)




