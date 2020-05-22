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
    
    # convert JSON keys of the PL file in a dictionary
    with open(sys.argv[1], "r") as f:
        dic = json.load(f)
    Component.sync_context(dic)

    # add the custom namespace to the Python exercise dictionary
    dic = {**namespace, **dic}
    
    if 'before' in dic:

        # execute the before script with the Python exercise dictionary
        exec(dic['before'], dic)
        
        # clean the the Python exercise dictionary from namespace elements
        exec("", namespace)
        for key in namespace:
            if key in dic and dic[key] == namespace[key]:
                del dic[key]

    # render some string values of the exercise dictionary with Jinja
    if 'jinja_keys' in dic:
        jinja_keys = dic['jinja_keys']
    else:
        jinja_keys = ['text', 'form', 'solution']
    
    for key in jinja_keys:
        if key in dic:
            dic[key] = Env.from_string(dic[key]).render(dic)

    # convert the Python exercise dictionary into a JSON dictionary and output the JSON dictionary
    with open(sys.argv[2], "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)

    sys.exit(0)
