import json, jsonpickle
from customdragdrop import MultiComp, DropGroup, LabelGroup
from ex import Ex

class JSONEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, (MultiComp, Ex)):
            return vars(obj)
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class JSONDecoder(json.JSONDecoder):

    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dic):
        if '__MultiComp__' in dic:
            if dic['__MultiComp__'] == 'DropGroup':
                return DropGroup(None, **dic)
            if dic['__MultiComp__'] == 'LabelGroup':
                return LabelGroup(None, **dic)
            else:
                return MultiComp(**dic)
        if '__Ex__' in dic:
            if dic['__Ex__'] == 'Radio':
                return ExRadio(**dic)
            if dic['__Ex__'] == 'Checkbox':
                return ExCheckbox(**dic)
            else:
                return Ex(**dic)
        return dic
