import json
import jsonpickle
import sympy
import sympy2latex

class CustomEncoder(json.JSONEncoder):
    def __init__(self, *args, **kwargs):
        json.JSONEncoder.__init__(self, *args, **kwargs)

    def default(self, obj):
        if isinstance(obj, (sympy.Basic, sympy.Matrix)):
            return {'__SymPy__': True, 'srepr': sympy.srepr(obj), 'latex': sympy.latex(obj)}
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class CustomDecoder(json.JSONDecoder):
    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dict):
        if '__SymPy__' in dict:
            return sympy.sympify(dict['srepr'], evaluate=False)
        return dict

