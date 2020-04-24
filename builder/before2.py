import sys, json
from sandboxio import get_context
from components import Component
from customdragdrop import DragDropGroup
import uuid

# Load the custom serialization function
#try:
#    from serialize import serialize
#except ModuleNotFoundError:
#    def serialize(arg):
#        return arg

####
try:
    from serialize import CustomEncoder, CustomDecoder
except ModuleNotFoundError:
    def serialize(arg):
        return arg

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
        if isinstance(dic[key], DragDropGroup):
            for k, item in dic[key].labels.items():
                    name = "c" + uuid.uuid4().hex
                    newcomp.append((name, item))
                    dic[key].labels[k] = {"cid": item.cid, "name": name, "selector": item.selector}
            for k, item in dic[key].drops.items():
                    name = "c" + uuid.uuid4().hex
                    newcomp.append((name, item))
                    dic[key].drops[k] = {"cid": item.cid, "name": name, "selector": item.selector}

    for name, comp in newcomp:
        comp.name = name
        dic[name] = comp

if __name__ == "__main__":
    
    # JSON context is converted into a python dictionary and stored in dic
    dic = get_context()

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

    # custom serialization is applied
    # for key in dic:
        # dic[key]=serialize(dic[key])

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

    class CustomEncoder(json.JSONEncoder):
        def default(self, obj):
            return jsonpickle.encode(obj, unpicklable=False)

    output_json = sys.argv[2]
    with open(output_json, "w+") as f:
        #f.write(jsonpickle.encode(dic, unpicklable=False))
        f.write(json.dumps(dic), cls=CustomEncoder)
    sys.exit(0)



