# Nouvelle version d'evaluator
from jinja2 import Environment, BaseLoader
import sys, json

# import Jinja environnement
from jinja_env import Env

from json_encoder import JSONEncoder, JSONDecoder

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
            obj.update(answers.get(obj['cid'], {}))
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

    #for k in list(answers.keys()):
    #    if isinstance(answers[k], dict):
    #        del answers[k]
    
    dic['answers'] = answers

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

    dic['form'] = dic['tplpage']

    with open(sys.argv[3], "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)

    with open(sys.argv[4], "w+", encoding='utf-8') as f:
        print("", file=f)
    
    print(int(score))
    
    sys.exit(0)
