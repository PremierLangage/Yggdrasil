#!/usr/bin/env python3
# coding: utf-8

import sys
from sandboxio import output, get_context
from components import Component

try:
    from serialize import serialize, deserialize
except ImportError:
    def serialize(arg):
        return arg
    def deserialize(dic):
        return arg

try:
    from env import env
except ImportError:
    env={}

class StopEvaluatorExec(Exception):
    pass

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



def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'except' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")


missing_evaluator_stderr = """\
The key 'evaluator' was not found in the context.
When using this grader, the PL must declare a script inside a key 'evaluator'. This script have
access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""

missing_grade_stderr = """\
'evaluator' did not declare the variable 'grade'.
The script have access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""

if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               +"Usage: python3 grader.py [input_json] [answer_jsonfile] [output_json] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    
    dic = get_context()

    comp=[e for e in dic if isinstance(e, Component)]

    for k in list(dic.keys()):
        if isinstance(dic[k],list):
            for i in range(len(dic[k])):
                if isinstance(dic[k][i], dict) and 'cid' in dic[k][i]:
                    dic[k][i] = dic[dic[k][i]['id']]

    for key in dic:
        dic[key]=deserialize(dic[key])

    dic = {**env, **dic}
    if 'evaluator' in dic:
        dic['StopEvaluatorExec'] = StopEvaluatorExec
        exec(add_try_clause(dic['evaluator'], StopEvaluatorExec), dic)
        exec("", env)
        for key in env:
            if key in dic and dic[key] == env[key]:
                del dic[key]
    else:
        print(missing_evaluator_stderr, file=sys.stderr)
        sys.exit(1)

    for key in dic:
        dic[key]=serialize(dic[key])
    
    if 'score' in dic:
        score=dic['score']    


    feedback=" "
    if 'feedback' in dic:
        feedback=dic['feedback']+" "

    if 'grade' in dic:
        score=dic['grade'][0]
        feedback=dic['grade'][1]+" "

    if score>=0:
        dic['attempt'] = dic['attempt'] + 1

    if dic['attempt'] > dic['maxattempt']:
        dic['buttons'] = ["reroll"]

    ffeedback=feedback
    if 'settings' in dic and 'feedback' in dic['settings']:
        if dic['settings']['feedback']=='rightwrong':
            ffeedback=format_feedback_rightwrong(score,feedback)
        elif dic['settings']['feedback']=='score':
            ffeedback=format_feedback_score(score,feedback)
        elif dic['settings']['feedback']=='lightscore':
            ffeedback=format_feedback_lightscore(score,feedback)

    output(score, ffeedback, dic)











