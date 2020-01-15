#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, time
from sandboxio import output, get_context, get_answers
from jinja2 import Template
from importlib import import_module
from sympy import *
from random import random as rd
#rd.seed(seed)
from utilsmath import *


def str_to_sympy(arg):
    if isinstance(arg,str):
        if arg[:11] == "_converted_":
            with evaluate(False):
                return sympify(arg[11:])
        elif arg[:14] == "_setconverted_":
            with evaluate(False):
                return FiniteSet(*sympify(arg[14:]))
        else:
            return arg
    elif isinstance(arg, dict):
        return {k: str_to_sympy(v) for k, v in arg.items()}
    elif isinstance(arg, list):
        return list(map(str_to_sympy,arg))
    elif isinstance(arg, tuple):
        return tuple(map(str_to_sympy,arg))
    else:
        return arg

def sympy_to_str(arg):
    if isinstance(arg,FiniteSet):
        return "_setconverted_"+str(arg.args)
    elif isinstance(arg,(Expr,Matrix)):
        return "_converted_"+str(arg)
    elif isinstance(arg,dict):
        return {k: sympy_to_str(v) for k, v in arg.items()}
    elif isinstance(arg,list):
        return list(map(sympy_to_str,arg))
    elif isinstance(arg,tuple):
        return tuple(map(sympy_to_str,arg))
    else:
        return arg
    return arg


def format_feedback(score,feedback):
    text0="""<div class="alert {}"><strong>{}</strong> {}</div>"""
    if score==-1:
        return text0.format('alert-info','Attention !',feedback)
    elif score==100:
        return text0.format('alert-success','Bonne réponse.',feedback)
    elif score==0:
        return text0.format('alert-danger','Mauvaise réponse.',feedback)
    else:
        return text0.format('alert-warning','Réponse partiellement correcte.',feedback)


class StopEvaluatorExec(Exception):
    pass


def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")

missing_evaluator_stderr = """\
The key 'evaluator' was not found in the context.
When using this grader, the PL must declare a script inside a key 'evaluator'. This script have
access to every variable declared in the PL and its 'before' script."""

missing_score_stderr = """\
'evaluator' did not declare the variable 'score'.
The script have access to every variable declared in the PL and its 'before' script.
It should declare a variable 'score' which should contain an integer between [0, 100]."""

if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               +"Usage: python3 grader.py [input_json] [output_json] [answer_file] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    
    dic = get_context()
    for key in dic:
        dic[key]=str_to_sympy(dic[key])
    dic['answer'] = get_answers()
    if 'evaluator' in dic:
        dic = dict(list(globals().items()) + list(dic.items()))
        dic['StopEvaluatorExec'] = StopEvaluatorExec
        exec(add_try_clause(dic['evaluator'], StopEvaluatorExec), dic)
        exec("", globals().copy())
        for key in globals().copy():
            if key in dic and dic[key] == globals()[key]:
                del dic[key]
        for key in dic:
            dic[key]=sympy_to_str(dic[key])
    else:
        print(missing_evaluator_stderr, file=sys.stderr)
        sys.exit(1)

    if 'score' in dic:
        score=dic['score']    
    else:
        print(missing_score_stderr, file=sys.stderr)
        sys.exit(1)

    if 'maxattempt' in dic:
        maxattempt=int(dic['maxattempt']) 
    else:
        maxattempt=1

    feedback=" "
    if 'feedback' in dic:
        feedback=dic['feedback']+" "

    solution=""
    if 'solution' in dic:
        solution=Template(dic['solution']).render(dic)
    
    if score>-1:
        dic['nbattempt'] +=1

    if (dic['nbattempt'] < int(dic['maxattempt'])) and score<100:
        dic['inputmode'] = "retry"
    else:
        dic['inputmode'] = "final"
        feedback+=solution

    ffeedback=feedback
    if 'settings' in dic:
        if 'feedback' in dic['settings']:
            if 'class' in dic['settings']['feedback']:
                if dic['settings']['feedback']['class']=='colorbox':
                    ffeedback=format_feedback(score,feedback)
                if dic['settings']['feedback']['class']=='score':
                    ffeedback="Score : %d / 100" % score

    output(score,ffeedback,dic)

