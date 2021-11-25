import sys, json
from components import Component
from builderlib import aux_component1, aux_component2, aux_component
from jinja2 import Environment, BaseLoader

# import Jinja environnement
from jinja_env import Env

from json_encoder import JSONEncoder, JSONDecoder

if __name__ == "__main__":

    with open(sys.argv[1], "r") as f:
        dic = json.load(f, cls=JSONDecoder)
    Component.sync_context(dic)

    with open(sys.argv[2], "r") as f:
        dic['answers'] = json.load(f)

    aux_component1(dic)

    eval_scripts = dic.get('eval_scripts', ['evaluator'])
    code = "\n".join([dic.get(name, "") for name in eval_scripts])

    exec(code, dic)
    namespace = {}
    exec("", namespace)
    for key in namespace:
        if key in dic and dic[key] == namespace[key]:
            del dic[key]

    aux_component2(dic)

    if 'score' in dic:
        score = dic['score']    
    if 'feedback' in dic:
        feedback = dic['feedback']  
    else:
        feedback = ""
      
    feedback = Env.from_string(feedback).render(dic)
    ffeedback = ""


    #dic['question'] = "Coucou !"
    # dic = json.loads(json.dumps(dic, cls=JSONEncoder))
    #dic['form'] = dic['tplpage']

    with open(sys.argv[3], "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)
    
    with open(sys.argv[4], "w+", encoding='utf-8') as f:
        print("", file=f)
    
    print(int(score))
    
    sys.exit(0)
