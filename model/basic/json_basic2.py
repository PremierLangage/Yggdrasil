import json, jsonpickle
from sympy import srepr, Basic, Matrix, sympify
from dropgroup import DropGroup
from mathinput import MathInput
from inputgroup import InputGroup
from steps import Step, StepRadio, StepCheckbox, StepTextInput, StepDropGroup
from stepmath import StepMath

class JSONEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, (Basic, Matrix)):
            return {'__SymPy__': True, 'srepr': srepr(obj)}
        if isinstance(obj, MathInput):
            return vars(obj)
        if isinstance(obj, StepMath):
            dic = vars(obj)
            for k, v in dic.items():
                if isinstance(v, dict):
                    dic[k] = self.default(v)
            return dic
        if isinstance(obj, (Step, DropGroup)):
            return vars(obj)
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class JSONDecoder(json.JSONDecoder):

    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dic):
        if '__SymPy__' in dic:
            return sympify(dic['srepr'], evaluate=False)
        if '__MathInput__' in dic:
            return MathInput(**dic)
        if '__Step__' in dic:
            #for k, v in dic.items():
            #    if isinstance(v, dict):
            #        dic[k] = self.object_hook(v)

        if '__DropGroup__' in dic:
            return DropGroup(**dic)
        if '__InputGroup__' in dic:
            return InputGroup(**dic)
        if '__Step__' in dic:
            if dic['__Step__'] == 'Radio':
                return StepRadio(**dic)
            elif dic['__Step__'] == 'Checkbox':
                return StepCheckbox(**dic)
            elif dic['__Step__'] == 'TextInput':
                return StepTextInput(**dic)
            elif dic['__Step__'] == 'DropGroup':
                return StepDropGroup(**dic)
            elif dic['__Step__'] == 'Math':
                return StepMath(**dic)
            else:
                return Step(**dic)
        return dic
