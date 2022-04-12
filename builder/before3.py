#!/usr/bin/env python3
# coding: utf-8
# Nouvelle version de before

import sys, json
from ast import literal_eval

# import JSON encoder
from json_encoder import JSONEncoder

# import Jinja environnement
from jinja_env import Env

def get_comps(obj, depth=0):
    comps = []
    if isinstance(obj, dict):
        if 'cid' in obj:
            if depth > 1:
                return [obj]
        else:
            for k, v in obj.items():
                comps += get_comps(v, depth+1)
    if isinstance(obj, list):
        for item in obj:
            comps += get_comps(item, depth+1)
    return comps
    

if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
                +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)

    outputfilename = sys.argv[2]

    # parse PL file into Python dictionary
    with open(sys.argv[1], "r") as f:
        dic = json.load(f)

    # parsing Python values
    for k, v in dic.items():
        try:
            dic[k] = literal_eval(str(v))
            if isinstance(dic[k], dict):
                for k2, v2 in dic[k].items():
                    dic[k][k2] = literal_eval(str(v2))
        except:
            pass
    
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


    # render some string values of the exercise dictionary with the custom Jinja environment 
    macros = dic.get('macros', '')

    for key in dic.get('jinja_keys', ['question', 'solution']):
        if key in dic:
            if isinstance(dic[key] , str):
                dic[key] = Env.from_string(macros + dic[key]).render(dic)
            elif isinstance(dic[key] , dict):
                for k in dic[key]:
                    dic[key][k] = Env.from_string(macros + dic[key][k]).render(dic)
            elif isinstance(dic[key] , list):
                for i in range(len(dic[key])):
                    dic[key][i] = Env.from_string(macros + dic[key][i]).render(dic)

    dic['form'] = dic['tplpage']

    # Serialize
    dic = json.loads(json.dumps(dic, cls=JSONEncoder))

    # Duplicate
    comps = get_comps(dic, 0)
    for i in range(len(comps)):
        dic[f"__comp{i}__"] = comps[i]


    with open(outputfilename, "w+") as f:
        json.dump(dic, f)

    sys.exit(0)
