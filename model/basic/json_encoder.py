import json, jsonpickle

class JSONEncoder(json.JSONEncoder):
    def default(self, obj):
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

JSONDecoder = None
