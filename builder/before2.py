import sys, json, jsonpickle
from components import Component
import uuid
from temp import aux_component

# Load the custom JSON encoder
try:
    from serialize import CustomEncoder
except ModuleNotFoundError:
    class CustomEncoder(json.JSONEncoder):
        def default(self, obj):
            return jsonpickle.Pickler(unpicklable=False).flatten(obj)

# Load the custom namespace
try:
    from namespace import namespace
except ModuleNotFoundError:
    namespace = {}

class StopBeforeExec(Exception):
    pass

def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n    ...\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")



if __name__ == "__main__":
    
    # JSON context is loaded
    with open(sys.argv[1], "r") as f:
        dic = json.load(f)
    Component.sync_context(dic)

    # the content of namespace is added to dic
    dic = {**namespace, **dic}
    
    if 'before' in dic:

        # execute the script in before key with dic as globals
        dic['StopBeforeExec'] = StopBeforeExec
        exec(add_try_clause(dic['before'], StopBeforeExec), dic)
        
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

    with open(sys.argv[2], "w+") as f:
        json.dump(dic, f, cls=CustomEncoder)

    sys.exit(0)


