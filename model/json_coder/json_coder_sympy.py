import json, jsonpickle
import sympy

try:
    from namespace import namespace
except ModuleNotFoundError:
    namespace = {}

def default(self, obj):
    if isinstance(obj, (sympy.Basic, sympy.Matrix)):
        return {'__SymPy__': True, 'srepr': sympy.srepr(obj)}
    return jsonpickle.Pickler(unpicklable=False).flatten(obj)

JSONEncoder = json.JSONEncoder(default=default)

def object_hook(self, dict):
    if '__SymPy__' in dict:
        return sympy.sympify(dict['srepr'], locals=namespace, evaluate=False)
    return dict

JSONDecoder = json.JSONDecoder(object_hook=object_hook)
