import json, jsonpickle
from dropgroup import DropGroup
from steps import Step
from exercises import Ex, ExRadio, ExCheckbox, ExInput, ExDragDrop
from multinput import MultInput

class JSONEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, (Step, DropGroup)):
            return vars(obj)
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class JSONDecoder(json.JSONDecoder):

    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dic):
        if '__DropGroup__' in dic:
            return DropGroup(**dic)
        if '__MultInput__' in dic:
            return MultInput(**dic)
        if '__Step__' in dic:
            if dic['__Step__'] == 'Radio':
                return StepRadio(**dic)
            elif dic['__Step__'] == 'Checkbox':
                return StepCheckbox(**dic)
            elif dic['__Step__'] == 'TextInput':
                return StepTextInput(**dic)
            elif dic['__Step__'] == 'DropGroup':
                return StepDropGroup(**dic)
            else:
                return Step(**dic)
        return dic
