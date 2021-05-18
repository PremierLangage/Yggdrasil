#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, os
from components import Component
from builderlib import aux_component
from jinja2 import Environment, BaseLoader
from sympy import Basic, Matrix, srepr
from sympy2latex import latex

# JSON encoder
class JSONEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, (Basic, Matrix)):
            return {'__SymPy__': True, 'srepr': srepr(obj)}
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

# Jinja environnement
from jinja_env import Env

def component(l):
    if isinstance(l, dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)

#Env = Environment(loader=BaseLoader())
#Env.filters["component"] = component

if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
                +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)

    outputfilename = sys.argv[2]

    # JSON context is loaded
    with open(sys.argv[1], "r") as f:
        dic = json.load(f)
    Component.sync_context(dic)
    
    before_scripts = dic.get('before_scripts', ['headerbefore', 'before', 'footerbefore'])
    code = "\n".join([dic.get(name, "") for name in before_scripts])

    # execute the script in before key with dic as globals
    exec(code, dic)
    
    namespace = {}
    # clean dic from namespace elements
    exec("", namespace)
    for key in namespace:
        if key in dic and dic[key] == namespace[key]:
            del dic[key]

    # build the key 'extracss' from the content of the key 'style'
    if 'style' in dic:
        dic['extracss'] = "%s" % "\n".join(reversed(list(dic['style'].values())))
    if 'javascript' in dic:
        dic['extrajs'] = "%s" % "\n".join(reversed(list(dic['javascript'].values())))

    # HACK for components in lists
    aux_component(dic)

    dic['internals'] = {'attempt': 1 }

    dic['form'] = dic['interface']
    # render some string values of the exercise dictionary with the custom Jinja environment
    jinja_keys = dic.get('jinja_keys', ['text', 'form', 'solution'])

    latexsettings = dic.get('latexettings', {})

    def customlatex(expr):
        return latex(expr, **latexsettings)

    #Env.filters["latex"] = customlatex

    for key in jinja_keys:
        if key in dic:
            dic[key] = Env.from_string(dic[key]).render(dic)

    with open(outputfilename, "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)

    sys.exit(0)
