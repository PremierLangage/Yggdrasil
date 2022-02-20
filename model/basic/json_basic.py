import json, jsonpickle
from customdragdrop import MultiComp, DropGroup, LabelGroup
from exercises import Ex, ExRadio, ExCheckbox, ExInput, ExDragDrop
from multinput import MultInput

class JSONEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, (MultiComp, Ex)):
            return vars(obj)
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class JSONDecoder(json.JSONDecoder):

    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dic):
        return dic
