import sys
import json
from components import Component
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

# Import the custom namespace
try:
    from namespace import namespace
except ModuleNotFoundError:
    namespace = {}


if __name__ == "__main__":
    
    # load the keys of a PL exercise in dictionary
    with open(sys.argv[1], "r") as f:
        dic = json.load(f)
    Component.sync_context(dic)

    # add custom namespace to the exercise dictionary
    dic = {**namespace, **dic}
    
    if 'before' in dic:

        # execute the script in before key with dic as globals
        exec(dic['before'], dic)
        
        # clean dic from namespace elements
        exec("", namespace)
        for key in namespace:
            if key in dic and dic[key] == namespace[key]:
                del dic[key]

    # build the key 'extracss' from the content of the key 'style'
    if 'style' in dic:
        dic['extracss'] = "<style> %s </style>" % "\n".join(reversed(list(dic['style'].values())))

    if 'jinja_keys' in dic:
        jinja_keys = dic('jinja_keys')
    else:
        jinja_keys = ['text', 'form', 'solution']
    
    for key in jinja_keys:
        if key in dic:
            dic[key] = Env.from_string(dic[key]).render(dic)

    with open(sys.argv[2], "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)

    sys.exit(0)
