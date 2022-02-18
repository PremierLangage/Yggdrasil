import json, jsonpickle
from customdragdrop import MultiComp, DropGroup, LabelGroup
from exercises import Ex, ExRadio, ExCheckbox, ExInput, ExDragDrop
from inputfields import MultInputField

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
        if '__MultInputField__' in dic:
            return MultInputField(**dic)
        if '__Ex__' in dic:
            if dic['__Ex__'] == 'Radio':
                return ExRadio(**dic)
            elif dic['__Ex__'] == 'Checkbox':
                return ExCheckbox(**dic)
            elif dic['__Ex__'] == 'Input':
                return ExInput(**dic)
            elif dic['__Ex__'] == 'DragDrop':
                return ExDragDrop(**dic)
            else:
                return Ex(**dic)
        return dic
