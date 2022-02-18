import json, jsonpickle
from sympy import srepr, Basic, Matrix, sympify
from mathinput import MathInput
from exmath import ExMath

class JSONEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, (Basic, Matrix)):
            return {'__SymPy__': True, 'srepr': srepr(obj)}
        if isinstance(obj, MathInput):
            return vars(obj)
        if isinstance(obj, ExMath):
            dic = vars(obj)
            for k, v in dic.items():
                if isinstance(v, dict):
                    dic[k] = self.default(v)
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class JSONDecoder(json.JSONDecoder):

    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dic):
        if '__SymPy__' in dic:
            return sympify(dic['srepr'], evaluate=False)
        if '__MathInput__' in dic:
            return MathInput(**dic)
        if '__Ex__' in dic:
            for k, v in dic.items():
                if isinstance(v, dict):
                    dic[k] = self.object_hook(v)
            if dic['__Ex__'] == 'Math':
                return ExMath(**dic)
        return dic
