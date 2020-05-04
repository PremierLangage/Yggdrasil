import json, jsonpickle
import sympy

try:
    from namespace import namespace
except ModuleNotFoundError:
    namespace = {}

class CustomEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, (sympy.Basic, sympy.Matrix)):
            return {'__SymPy__': True, 'srepr': sympy.srepr(obj)}
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class CustomDecoder(json.JSONDecoder):
    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dict):
        if '__SymPy__' in dict:
            return sympy.sympify(dict['srepr'], locals=namespace, evaluate=False)
        return dict


