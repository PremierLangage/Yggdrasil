#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, time

from sandboxio import output, get_context

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

    if 'evaluator' in dic:
        glob = {}
        dic['StopEvaluatorExec'] = StopEvaluatorExec
        exec(add_try_clause(dic['evaluator'], StopEvaluatorExec),{},dic)
    else:
        print(missing_evaluator_stderr, file=sys.stderr)
        sys.exit(1)
    
    if 'grade' not in dic:
        print(missing_grade_stderr, file=sys.stderr)
        sys.exit(1)

    step=dic['step']
    step=step+1
    dic['step']=step
    settings=dic['settings']
    lst=[]
    for i in range(1,1+settings['repetition']):
        if step == i:
            lst.append(r"<span class='badge badge-primary'> %s </span>" % str(i+1))
        else:
            lst.append(r"<span class='badge badge-secondary'> %s </span>" % str(i+1))


    score=dic['grade'][0]
    feedback=dic['grade'][1]+" "


    output(score, ffeedback, dic)


