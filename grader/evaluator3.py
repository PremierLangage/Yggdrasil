# Nouvelle version d'evaluator

import sys, json, jsonpickle
from builderlib import aux_component1, aux_component2, aux_component
from jinja2 import Environment, BaseLoader

# import Jinja environnement
from jinja_env import Env

from json_encoder import JSONEncoder, JSONDecoder

from sympy import Basic, Matrix
from inputfields import Serializable, Radio, Checkbox

class JSONEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, (Basic, Matrix)):
            return {'__SymPy__': True, 'srepr': srepr(obj)}
        if isinstance(obj, Serializable):
            dic = vars(obj)
            dic["__classname__"] = obj.__class__.__name__
            for k, v in dic.items():
                if isinstance(v, dict):
                    dic[k] = self.default(v)
            return dic
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

class JSONDecoder(json.JSONDecoder):

    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dic):
        if '__SymPy__' in dic:
            return sympify(dic['srepr'], evaluate=False)
        if '__classname__' in dic:
            return globals()[dic["__classname__"]](**dic)
        return dic

def get_comps(obj, depth=0):
    comps = []
    if isinstance(obj, dict):
        if 'cid' in obj:
            if depth > 1:
                return [obj]
        else:
            for k, v in obj.items():
                comps += get_comps(v, depth+1)
    if isinstance(obj, list):
        for item in obj:
            comps += get_comps(item, depth+1)
    return comps


def sync_comps(obj):
    if isinstance(obj, dict):
        if 'cid' in obj:
            obj.update(answers[obj['cid']])
        # TODO : fid for form inputs
        else:
            for k, v in obj.items():
                sync_comps(v)
    if isinstance(obj, list):
        for item in obj:
            sync_comps(item)

if __name__ == "__main__":

    with open(sys.argv[1], "r") as f:
        dic = json.load(f)

    for k in list(dic.keys()):
        if k.startswith('__comp'):
            del dic[k]

    with open(sys.argv[2], "r") as f:
        answers = json.load(f)

    sync_comps(dic)

    # deserialize
    dic = json.loads(json.dumps(dic), cls=JSONDecoder)

    eval_scripts = dic.get('eval_scripts', ['evaluator'])
    code = "\n".join([dic.get(name, "") for name in eval_scripts])

    exec(code, dic)
    namespace = {}
    exec("", namespace)
    for key in namespace:
        if key in dic and dic[key] == namespace[key]:
            del dic[key]

    # Serialize
    dic = json.loads(json.dumps(dic, cls=JSONEncoder))

    # Duplicate
    comps = get_comps(dic, 0)
    for i in range(len(comps)):
        dic[f"__comp{i}__"] = comps[i]
    

    if 'score' in dic:
        score = dic['score']    
    if 'feedback' in dic:
        feedback = dic['feedback']  
    else:
        feedback = ""
      
    feedback = Env.from_string(feedback).render(dic)
    ffeedback = ""

    macros = dic.get('macros', '')

    try:
        for key in dic.get('jinja_keys', ['question', 'solution']):
            if key in dic:
                key2 = f"_{key}_"
                if key2 in dic:
                    if isinstance(dic[key] , str):
                        dic[key] = dic[key2].replace(r"{% raw %}", "")
                        dic[key] = dic[key].replace(r"{% endraw %}", "")         
                        dic[key] = Env.from_string(macros+dic[key]).render(dic)
                    elif isinstance(dic[key] , dict):
                        for k in dic[key]:
                            dic[key][k] = dic[key2][k].replace(r"{% raw %}", "")
                            dic[key][k] = dic[key][k].replace(r"{% endraw %}", "")         
                            dic[key][k] = Env.from_string(macros+dic[key][k]).render(dic)
    except:
        pass

    dic['form'] = dic['tplpage']

    with open(sys.argv[3], "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)

    with open(sys.argv[4], "w+", encoding='utf-8') as f:
        print("", file=f)
    
    print(int(score))
    
    sys.exit(0)
