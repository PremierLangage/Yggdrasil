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

def process_answer(answer,dic):
    for name,config in dic['input'].items():
        input_type=config['type']
        try:
            process=import_module(input_type+'_process')
        except:
            pass
        else:
            process.process_answer(answer,name,dic['input'][name])

def build_form(form_template,dic):
    form_context={}
    for name,config in dic['input'].items():
        input_type=config['type']
        if 'tags' in config:
            for tag in config['tags'].keys():
                tag_type=config['tags'][tag]['type']
                tag_context={**config['tags'][tag],'name':tag}
                with open (tag_type+'_template.html', "r") as f:
                    form_context['input_'+name+'_'+tag]=Template(f.read()).render(tag_context)
        else:
            input_context={**config,'name':name,'inputmode':'final'}
            with open (input_type+'_template.html', "r") as f:
                form_context['input_'+name]=Template(f.read()).render(input_context)
    return Template(form_template).render({**form_context,**dic})

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
    elif isinstance(arg,(Basic,Matrix)):
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


def format_analysis(msg,text,n,lang):
    dcls={'warning':'alert-info','retry':'alert-warning','fail':'alert-danger','success':'alert-success'}
    ditext={'en':{'warning':'Warning !','retry':'Try again !','fail':'Fail.','success':'Good.'},
        'fr':{'warning':'Attention !','retry':'Mauvaise réponse.','fail':'Mauvaise réponse.','success':'Bonne réponse.'}}
    cls=dcls[msg]
    itext=ditext[lang][msg]
    if msg=='warning' or msg=='retry':
        if n>1:
            format_text="""<div class="alert {}">
  <strong>{}</strong> {} <br> Il reste {} tentatives.</div>""".format(cls,itext,text,n)
        else:
            format_text="""<div class="alert {}">
  <strong>{}</strong> {} <br> Il reste 1 tentative.</div>""".format(cls,itext,text)

    else:
        format_text="""<div class="alert {}">
  <strong>{}</strong> {}</div>""".format(cls,itext,text)
    return format_text


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
    dic['answer'] = get_answers()
    if 'input' in dic:
        process_answer(dic['answer'],dic)
    if 'evaluator' in dic:
        dic['StopEvaluatorExec'] = StopEvaluatorExec
        for key in dic:
            dic[key]=str_to_sympy(dic[key])
        code=dic['evaluator']
        exec(add_try_clause(code, StopEvaluatorExec), globals(),dic)
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

    if 'feedback' in dic:
        feedback= dic['feedback']
    else:
        feedback=""

    if 'lang' in dic:
        lang= dic['lang']
    else:
        lang="fr"

    
    if score>-1:
        dic['nbattempt'] +=1

    nbattempt=dic['nbattempt']

    if (dic['nbattempt'] < int(dic['maxattempt'])) and score<100:
        dic['inputmode'] = "retry"
    else:
        dic['inputmode'] = "final"

    if score==100:
        format_feedback=format_analysis('success',feedback,0,lang)
    elif score==-1:
        format_feedback=format_analysis('warning',feedback,maxattempt-nbattempt,lang)
    else:
        if nbattempt<maxattempt:
            format_feedback=format_analysis('retry',feedback,maxattempt-nbattempt,lang)
        else:
            if 'solution' in dic:
                format_feedback=format_analysis('fail',feedback+Template(dic['solution']).render(dic),0,lang)
            else:
                format_feedback=format_analysis('fail',feedback,0,lang)
    
    if 'input' in dic:
        dic['form']=dic['head']+build_form(dic['form0'],dic)
    
    output(score,format_feedback,dic)






