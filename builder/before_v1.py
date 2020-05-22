import sys
import json
from components import Component
from pljson import PickleEncoder
from pljinja import DefaultEnv

# import the custom JSON encoder (if it exists)
try:
    from json_coder import JSONEncoder
except ModuleNotFoundError:
    JSONEncoder = PickleEncoder

# import the custom Jinja environnement (if it exists)
try:
    from jinja_env import Env
except ModuleNotFoundError:
    Env = DefaultEnv

# import the custom namespace (if it exists)
try:
    from namespace import namespace
except ModuleNotFoundError:
    namespace = {}


if __name__ == "__main__":
    
    # load the JSON keys of the PL file in a dictionary
    with open(sys.argv[1], "r") as f:
        dic = json.load(f)
    Component.sync_context(dic)

    # add the custom namespace to the Python exercise dictionary
    dic = {**namespace, **dic}
    
    if 'before' in dic:

        # execute the before script with the Python exercise dictionary
        # as the global dictionary
        exec(dic['before'], dic)
        
        # clean dic from namespace elements
        exec("", namespace)
        for key in namespace:
            if key in dic and dic[key] == namespace[key]:
                del dic[key]

    # build the key 'extracss' from the content of the key 'style'
    if 'style' in dic:
        dic['extracss'] = "<style> %s </style>" % "\n".join(reversed(list(dic['style'].values())))

    # render some dictionary values
    if 'jinja_keys' in dic:
        jinja_keys = dic['jinja_keys']
    else:
        jinja_keys = ['text', 'form', 'solution']
    
    for key in jinja_keys:
        if key in dic:
            dic[key] = Env.from_string(dic[key]).render(dic)

    # convert the Python exercise dictionary into a JSON dictionary and output it
    with open(sys.argv[2], "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)

    sys.exit(0)
