#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from sandboxio import output, get_context
from components import Component
from jinja2 import Environment, BaseLoader


def component(l):
    if isinstance(l,dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)

env = Environment(loader=BaseLoader())
env.globals.update({
    "component":    component
})
env.filters["component"] = component


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

# HACK for components in lists
# dictionaries with cid key in lists are replaced
# by corresponding components
def aux_component1(dic):
    for key in dic:
        if isinstance(dic[key], list):
            for i in range(len(dic[key])):
                item = dic[key][i]
                if isinstance(item, dict) and 'cid' in item:
                    name = item['name']
                    dic[key][i] = dic[name]
                    dic[key][i].name = name

# HACK for components in lists
# components in lists are duplicated outside the lists
# and replaced by dictionaries inside the lists
def aux_component2(dic):
    newcomp = []
    for key in dic:
        if isinstance(dic[key], list):
            for i in range(len(dic[key])):
                item = dic[key][i]
                if isinstance(item, Component):
                    name = item.name
                    newcomp.append((name, item))
                    dic[key][i] = {"cid": item.cid, "name": name, "selector": item.selector}



if __name__ == "__main__":

    dic = get_context()

    step = dic['step']

    if step == -1:
        score = 0
    else:
        for key in dic:
            dic[key]=deserialize(dic[key])

        dic = {**namespace, **dic}

        aux_component1(dic)
        
        if 'evaluatorstep' in dic:
            if isinstance(dic['evaluatorstep'], list):
                code = dic['evaluatorstep'][step]
            elif isinstance(dic['evaluatorstep'], dict):
                code = dic['evaluatorstep'][dic['stepseq'][step]]
            else:
                code = dic['evaluatorstep']
        else:
            print(missing_evaluator_stderr, file=sys.stderr)
            sys.exit(1)

        dic['StopEvaluatorExec'] = StopEvaluatorExec
        exec(add_try_clause(code, StopEvaluatorExec), dic)
        exec("", namespace)
        for key in namespace:
            if key in dic and dic[key] == namespace[key]:
                del dic[key]

        for key in dic:
            dic[key]=serialize(dic[key])

        aux_component2(dic)

        score = dic['score']
        dic['scores'].append(score)
        if 'feedback' in dic:
            dic['all_steps'] += format_feedback_rightwrong(score, dic["feedback"])
        score = score//dic['nbstep']


    step += 1
    dic['step'] = step
    
    if dic['step'] < dic['nbstep']:
        feedback = " "

        if 'textstep' in dic:
            if isinstance(dic['textstep'], list):
                dic['text'] = dic['textstep'][step]
            elif isinstance(dic['textstep'], dict):
                dic['text'] = dic['textstep'][dic['stepseq'][step]]
            else:
                dic['text'] = dic['textstep']

        if 'formstep' in dic:
            if isinstance(dic['formstep'], list):
                dic['form'] = dic['formstep'][step]
            elif isinstance(dic['formstep'], dict):
                dic['form'] = dic['formstep'][dic['stepseq'][step]]
            else:
                dic['form'] = dic['formstep']

        dic['all_steps'] += env.from_string(dic['text']+" \n "+dic['form']+" \n ").render(dic)
        if dic['settings']['cumulative']:
            dic['text'] = ""
            dic['form'] = dic['all_steps']
    else:
        score = int(round(sum(dic['scores'])/dic['nbstep']))
        dic['text'] = format_feedback_lightscore(score, "") + dic['all_steps']
        dic['form'] = ""
        dic['internals']['buttons'] = ["reroll"]

    output(score, " ", dic)








