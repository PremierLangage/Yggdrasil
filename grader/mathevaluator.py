import sys, json, jsonpickle
from components import Component
from builderlib import aux_component1, aux_component2, aux_component
import sympy
from jinja2 import Environment, BaseLoader
from jinja2 import Template

Env = Environment(loader=BaseLoader())

class CustomEncoder(json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, (sympy.Basic, sympy.Matrix)):
            return {'__SymPy__': True, 'srepr': sympy.srepr(obj)}
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)


class CustomDecoder(json.JSONDecoder):

    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dict):
        if '__SymPy__' in dict:
            # option in sympify : locals=namespace
            return sympy.sympify(dict['srepr'], evaluate=False)
        return dict


missing_evaluator_stderr = """\
The key 'evaluator' was not found in the context.
When using this grader, the PL must declare a script inside a key 'evaluator'. This script have
access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""

if __name__ == "__main__":

    with open(sys.argv[1], "r") as f:
        dic = json.load(f, cls=CustomDecoder)
    Component.sync_context(dic)

    with open(sys.argv[2], "r") as f:
        dic['answers'] = json.load(f)

    
    aux_component1(dic)
    
    if 'evaluator' in dic:
            code = dic['evaluator']
    else:
        print(missing_evaluator_stderr, file=sys.stderr)
        sys.exit(1)

    #code = "\n".join([dic.get('headerevaluator', ""), dic.get('evaluator', ""), dic.get('footerevaluator', "")])

    exec(code, dic)
    namespace = {}
    exec("", namespace)
    for key in namespace:
        if key in dic and dic[key] == namespace[key]:
            del dic[key]

    aux_component2(dic)
    
    if 'grade' in dic:
        score = dic['grade'][0]
        feedback = dic['grade'][1] + " "
    else:
        if 'score' in dic:
            score = dic['score']    
        if 'feedback' in dic:
            feedback = dic['feedback']  
        else:
            feedback=" "

    if score >= 0:
        dic['internals']['attempt'] = dic['internals']['attempt'] + 1
    
    if dic['settings']['maxattempt'] is not None:
        if dic['internals']['attempt'] > dic['settings']['maxattempt']:
            try:
                dic['internals']['buttons'].remove('submit')
            except:
                pass
            if score < 100 and 'solution' in dic:
                dic['form'] = "\n".join([dic['form'], dic['linksolution']])
    
    feedback = Env.from_string(feedback).render(dic)
    ffeedback = ""

    # dic = json.loads(json.dumps(dic, cls=CustomEncoder))

    # hack for MathQuill
    if 'answers' in dic:
        if 'math' in dic['answers']:
            dic['prev_value'] = dic['answers']['math'].replace("\\", "\\\\")



    # render some string values of the exercise dictionary with the custom Jinja environment
    #jinja_keys = dic.get('jinja_keys', ['text', 'form', 'solution'])

    #for key in ['modal']:
    #    if key in dic:
    #        dic[key] = Env.from_string(dic[key]).render(dic)

    with open(sys.argv[3], "w+") as f:
        json.dump(dic, f, cls=CustomEncoder)
    
    with open(sys.argv[4], "w+", encoding='utf-8') as f:
        print("", file=f)
    
    print(int(score))
    
    sys.exit(0)
