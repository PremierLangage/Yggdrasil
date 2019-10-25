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

    score=dic['grade'][0]
    feedback=dic['grade'][1]

    if score>=0:
        dic['attempt'] = dic['attempt'] + 1

    if dic['attempt'] > dic['maxattempt']:
        dic['buttons'] = ["reroll"]

    if dic['maxattempt'] > 1:
        text0 = "Tentative : %d / %d <br>" % (dic['attempt'],dic['maxattempt'])
        dic['text'] = text0 + dic['text']

    output(score, format_feedback(score,feedback), dic)




