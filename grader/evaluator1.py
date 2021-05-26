import sys, json
from components import Component
from builderlib import aux_component1, aux_component2, aux_component
from jinja2 import Environment, BaseLoader

Env = Environment(loader=BaseLoader())

from json_encoder import JSONEncoder, JSONDecoder

if __name__ == "__main__":

    with open(sys.argv[1], "r") as f:
        dic = json.load(f, cls=JSONDecoder)
    Component.sync_context(dic)

    with open(sys.argv[2], "r") as f:
        dic['answers'] = json.load(f)

    aux_component1(dic)
    
    code = dic['evaluator']

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

    # dic = json.loads(json.dumps(dic, cls=JSONEncoder))


    with open(sys.argv[3], "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)
    
    with open(sys.argv[4], "w+", encoding='utf-8') as f:
        print("", file=f)
    
    print(int(score))
    
    sys.exit(0)
