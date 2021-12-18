import json, jsonpickle
from multicomp import MultiComp, DropGroup

class JSONEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, MultiComp):
            return vars(obj)
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class JSONDecoder(json.JSONDecoder):

    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dic):
        if '__MultiComp__' in dic:
            if dic['__MultiComp__'] == 'DropGroup':
                return DropGroup(**dic)
            else:
                return MultiComp(**dic)
        return dic
