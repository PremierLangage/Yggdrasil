#!/usr/bin/env python3
# coding: utf-8
import sys, json
from components import Component
from builderlib import aux_component

# Import the custom JSON encoder
from json_encoder import JSONEncoder

# Jinja environnement
from jinja_env import Env

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
    dic['question'] = dic['text']

    # render some string values of the exercise dictionary with the custom Jinja environment 
    macros = dic.get('macros', '')

    for key in dic.get('jinja_keys', ['text', 'form', 'solution']):
        if key in dic:
            dic[key] = Env.from_string(macros + dic[key]).render(dic)

    dic['form'] = dic['template']

    with open(outputfilename, "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)

    sys.exit(0)
