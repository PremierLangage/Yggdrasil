import sys, json
from components import Component
from builderlib import aux_component1, aux_component2, aux_component
from jinja2 import Environment, BaseLoader

Env = Environment(loader=BaseLoader())

from builderlib import PickleEncoder as JSONEncoder
from builderlib import PickleDecoder as JSONDecoder

missing_evaluator_stderr = """\
The key 'evaluator' was not found in the context.
When using this grader, the PL must declare a script inside a key 'evaluator'. This script have
access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""

if __name__ == "__main__":

    with open(sys.argv[1], "r") as f:
        dic = json.load(f, cls=JSONDecoder)
    Component.sync_context(dic)

    with open(sys.argv[2], "r") as f:
        dic['answers'] = json.load(f)

    
    aux_component1(dic)
    currentstep = dic['_currentstep_']
    code = dic['step'][currentstep]['evaluator']

    #code = "\n".join([dic.get('headerevaluator', ""), dic.get('evaluator', ""), dic.get('footerevaluator', "")])

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

    if score >= 0:
        dic['internals']['attempt'] = dic['internals']['attempt'] + 1
    
    #dic['form'] = dic['interface']

    if feedback.strip() != "":
        dic['form'] = "\n".join([dic['form'], dic['format_feedback']])

    if dic['settings']['maxattempt'] is not None:
        if dic['internals']['attempt'] > dic['settings']['maxattempt']:
            if score < 100 and 'solution' in dic:
                dic['form'] = "\n".join([dic['form'], dic['linksolution']])
    
    feedback = Env.from_string(feedback).render(dic)
    ffeedback = ""

    # dic = json.loads(json.dumps(dic, cls=JSONEncoder))

    # hack for MathQuill
    if 'answers' in dic:
        if 'math' in dic['answers']:
            dic['prev_value'] = dic['answers']['math'].replace("\\", "\\\\")

    with open(sys.argv[3], "w+") as f:
        json.dump(dic, f, cls=JSONEncoder)
    
    with open(sys.argv[4], "w+", encoding='utf-8') as f:
        print("", file=f)
    
    print(int(score))
    
    sys.exit(0)
