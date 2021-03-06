#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from jinja2 import Template
from importlib import import_module

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
        glob = {}
        dic['StopBeforeExec'] = StopBeforeExec
        code=""
        if 'headbefore' in dic:
            code+=dic['headbefore']+ '\n'
        code+=dic['before']+ '\n'
        if 'footerbefore' in dic:
            code+=dic['footerbefore']
        exec(add_try_clause(code, StopBeforeExec), dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]

    if 'maxattempt' not in dic:
        dic['maxattempt']=1

    dic['nbattempt']=0

    dic['inputmode'] = "initial"    

    if 'input' in dic:
        render_input_config(dic)
        dic['form0']=dic['form']+"\n <div style='width:100%;height:200px;'>"
        dic['head']=build_head(dic) 
        dic['form']=dic['head']+build_form(dic['form0'],dic)+"</div>"

    if 'style' in dic:
        dic['form']+="""
            <style>
            {}
            </style>
            """.format(dic['style'])

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)













