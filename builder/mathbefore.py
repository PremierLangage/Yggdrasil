#!/usr/bin/env python3
# coding: utf-8

import sys, json, os
from components import Component
from builderlib import aux_component
from builderlib import PickleEncoder, ComponentEnv

# Import the custom JSON encoder
try:
    from json_encoder import CustomEncoder as JSONEncoder
except ModuleNotFoundError:
    JSONEncoder = PickleEncoder

# Import the custom Jinja environnement
try:
    from jinja_env import CustomEnv as Env
except ModuleNotFoundError:
    Env = ComponentEnv

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
    
    code = "\n".join([dic.get('headerbefore', ""), dic.get('before', ""), dic.get('footerbefore', "")])

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
        dic['extracss'] = "<style> %s </style>" % "\n".join(reversed(list(dic['style'].values())))

    # HACK for components in lists
    aux_component(dic)

    if 'settings' not in dic:
        dic['settings'] = {}

    if 'internals' not in dic:
        dic['internals'] = {}

    if 'scenario' in dic['settings']:
        dic['internals']['buttons'] = ["submit","reroll"]
    else:
        dic['internals']['buttons'] = ["submit","reroll"]

    dic['internals']['attempt'] = 1

    # render some string values of the exercise dictionary with the custom Jinja environment
    jinja_keys = dic.get('jinja_keys', ['text', 'form', 'solution'])

    for key in jinja_keys:
        if key in dic:
            dic[key] = Env.from_string(dic[key]).render(dic)

    with open(outputfilename, "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)

    sys.exit(0)
