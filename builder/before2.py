import sys, json
from components import Component
import uuid
from builderlib import aux_component
from builderlib import PickleEncoder, add_try_clause, ComponentEnv

# Load the custom JSON encoder
try:
    from json_encoder import CustomEncoder
except ModuleNotFoundError:
    CustomEncoder = PickleEncoder

# Load the custom Jinja environnement
try:
    from jinja_env import CustomEnv as env
except ModuleNotFoundError:
    env = ComponentEnv

# Load the custom namespace
try:
    from namespace import namespace
except ModuleNotFoundError:
    namespace = {}

class StopBeforeExec(Exception):
    pass


if __name__ == "__main__":
    
    # JSON context is loaded
    with open(sys.argv[1], "r") as f:
        dic = json.load(f)
    Component.sync_context(dic)

    # the content of namespace is added to dic
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

    for key in ['text', 'form', 'solution']:
        if key in dic:
            dic[key] = env.from_string(dic[key]).render(dic)

    with open(sys.argv[2], "w+") as f:
        json.dump(dic, f, cls=CustomEncoder)

    sys.exit(0)



