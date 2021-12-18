import json, jsonpickle

class JSONEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, MultiComponent):
            return vars(obj)
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class JSONDecoder(json.JSONDecoder):

    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dic):
        if '__MultiComponent__' in dic:
            return MultiComponent(**dic)
        return dic
