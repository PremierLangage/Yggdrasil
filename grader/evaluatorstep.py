#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from sandboxio import output, get_context
from components import Component
from jinja2 import Template

try:
    from serialize import serialize, deserialize
except ImportError:
    def serialize(arg):
        return arg
    def deserialize(arg):
        return arg

try:
    from namespace import namespace
except ImportError:
    namespace = {}

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

    for key in dic:
        dic[key]=deserialize(dic[key])

    dic = {**namespace, **dic}
    if 'evaluator' in dic:
        dic['StopEvaluatorExec'] = StopEvaluatorExec
        exec(add_try_clause(dic['evaluator'], StopEvaluatorExec), dic)
        exec("", namespace)
        for key in namespace:
            if key in dic and dic[key] == namespace[key]:
                del dic[key]
    else:
        print(missing_evaluator_stderr, file=sys.stderr)
        sys.exit(1)

    for key in dic:
        dic[key]=serialize(dic[key])

    step = dic['step']
    if dic['step'] < dic['nbstep']:
        dic['text'] = """Question {{step}}
        {{ texts[step]}}
        """
        dic['form'] = """
        {{ comp[step]|component }}
        """
    else:
        dic['form'] = """
        {% for e in comp %}
        Question {{ loop.index }}
        {{ texts[loop.index0]}}
        {{ e|component }}
        {% endfor %}
        """
    
    dic['step'] +=1
    score = -1

    output(score, " ", dic)

