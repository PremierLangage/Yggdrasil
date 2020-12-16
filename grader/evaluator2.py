#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from components import Component
from builderlib import aux_component1, aux_component2, aux_component
from builderlib import PickleEncoder, ComponentEnv

from jinja2 import Template

try:
    from json_encoder import CustomEncoder, CustomDecoder
except ModuleNotFoundError:
    CustomEncoder = PickleEncoder
    CustomDecoder = None

# Import the custom Jinja environnement
try:
    from jinja_env import CustomEnv as Env
except ModuleNotFoundError:
    Env = ComponentEnv

try:
    from namespace import namespace
except ModuleNotFoundError:
    namespace = {}

def format_feedback_rightwrong(score,feedback):
    tpl="""<div class="alert {}"><strong>{}</strong> <br> {}</div>"""
    if score==-1:
        return tpl.format('alert-info','Attention !',feedback)
    elif score==100:
        return tpl.format('alert-success','Bonne réponse.',feedback)
    else:
        return tpl.format('alert-danger','Mauvaise réponse.',feedback)

def format_feedback_score(score,feedback):
    if score==-1:
        tpl="""<div class="alert {}"><strong>{}</strong><br> {}</div>"""
        return tpl.format('alert-info',score, feedback)
    tpl="""<div class="alert {}"><strong>Score : {} / 100</strong><br> {}</div>"""
    if score==100:
        return tpl.format('alert-success',score, feedback)
    elif score==0:
        return tpl.format('alert-danger',score, feedback)
    else:
        return tpl.format('alert-warning',score, feedback)

def format_feedback_lightscore(score,feedback):
    if score==-1:
        tpl="""<div class="alert {}"><strong>{}</strong> <br> {}</div>"""
        return tpl.format('alert-info',score, feedback)
    tpl="""<div class="alert alert-secondary"><strong>Score : {} / 100 <br> </strong> {}</div>"""
    return tpl.format(score,feedback)



missing_evaluator_stderr = """\
The key 'evaluator' was not found in the context.
When using this grader, the PL must declare a script inside a key 'evaluator'. This script have
access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""

if __name__ == "__main__":

    with open(sys.argv[1], "r") as f:
        dic = json.load(f, cls=CustomDecoder)
    Component.sync_context(dic)

    dic = {**namespace, **dic}

    aux_component1(dic)
    
    if 'evaluator' in dic:
            code = dic['evaluator']
    else:
        print(missing_evaluator_stderr, file=sys.stderr)
        sys.exit(1)

    exec(code, dic)
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
                feedback += dic['solution']
            elif score < 100 and 'message' in dic:
                if 'Solution' in dic['message']:
                    feedback += dic['message']['Solution']
    
    feedback = Env.from_string(feedback).render(dic)
    if 'feedback' in dic['settings']:
        if dic['settings']['feedback']=='rightwrong':
            ffeedback=format_feedback_rightwrong(score,feedback)
        elif dic['settings']['feedback']=='score':
            ffeedback=format_feedback_score(score,feedback)
        elif dic['settings']['feedback']=='lightscore':
            ffeedback=format_feedback_lightscore(score,feedback)

    # dic = json.loads(json.dumps(dic, cls=CustomEncoder))


    with open(sys.argv[3], "w+") as f:
        json.dump(dic, f, cls=CustomEncoder)
    
    with open(sys.argv[4], "w+") as f:
        print(str(ffeedback), file=f)
    
    print(int(score))
    
    sys.exit(0)








