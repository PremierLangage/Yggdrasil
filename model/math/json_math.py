import json, jsonpickle
from sympy import srepr, Basic, Matrix, sympify
#from mathinput import MathInput

class JSONEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, (Basic, Matrix)):
            return {'__SymPy__': True, 'srepr': srepr(obj)}
        #elif isinstance(obj, MathInput):
        #    return vars(obj)
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class JSONDecoder(json.JSONDecoder):

    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dic):
        if '__SymPy__' in dic:
            return sympify(dic['srepr'], evaluate=False)
        elif '__MathInput__' in dic:
            return "" #MathInput(dic)
        return dic
