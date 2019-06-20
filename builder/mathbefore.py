#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from jinja2 import Template
from importlib import import_module
from sympy import *
from random import random as rd
#rd.seed(seed)
from utilsmath import *

def render_dic_strings(d,dic):
    for k, v in d.items():
        if isinstance(v, dict):
            render_dic_strings(v,dic)
        else:
            d[k]=Template(d[k]).render(dic)

def render_input_config(dic):
    render_dic_strings(dic['input'],dic)

def build_head(dic):
    head=""
    for name,config in dic['input'].items():
        input_type=config['type']
        try:
            with open (input_type+'_head.html', "r") as f:
                head+=f.read()
        except:
            pass
    return head

def build_form(form_template,dic):
    form_context={}
    for name,config in dic['input'].items():
        input_type=config['type']
        try:
            process=import_module(input_type+'_process')
        except:
            pass
        else:
            process.process_config(config,name)
        if 'tags' in config:
            for tag in config['tags'].keys():
                tag_type=config['tags'][tag]['type']
                tag_context={**config['tags'][tag],'name':tag}
                with open (tag_type+'_template.html', "r") as f:
                    form_context['input_'+tag]=Template(f.read()).render(tag_context)
        else:
            input_context={**config,'name':name,'inputmode':'initial'}
            with open (input_type+'_template.html', "r") as f:
                form_context['input_'+name]=Template(f.read()).render(input_context)
    return Template(form_template).render({**form_context,**dic})

def sympy_to_str(arg):
    if isinstance(arg,(Basic,Matrix)):
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

class StopBeforeExec(Exception):
    pass

def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    input_json = sys.argv[1]
    output_json = sys.argv[2]
    
    with open(input_json, "r") as f:
        dic = json.load(f)
    
    if 'before' in dic:
        if 'latexparam' in dic:
            LatexPrinter._settings.update(eval(dic['latexparam']))
        #glob = {'sqrt': sqrt, 'ln': log, 'log': log, 'exp': exp, 'sin': sin, 'cos': cos, 'tan': tan,'I': I, 'E': E, 'pi': pi, 'isprime': isprime, 'factorint': factorint, 'Intersection': Intersection, 'symbols': symbols, 'Symbol': Symbol, 'conjugate': conjugate,'Rational': Rational, 'trace': trace, 'sympify': sympify}
        dic['StopBeforeExec'] = StopBeforeExec
        code=dic['before']
        exec(add_try_clause(code, StopBeforeExec),globals(),dic)
        for key in dic:
            dic[key]=sympy_to_str(dic[key])

    if 'input' in dic:
        render_input_config(dic)
        dic['form0']=dic['form']#+"\n <div style='width:100%;height:200px;'>"
        dic['head']=build_head(dic) 
        dic['form']=dic['head']+build_form(dic['form0'],dic)+"</div>"

    dic['nbattempt']=0

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)

