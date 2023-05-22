#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, time

from sandboxio import output, get_context, get_answers


class StopEvaluatorExec(Exception):
    pass


def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n    ...\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")

def dograderclause(name,dic):
        glob = {}
        dic['StopBeforeExec'] = StopBeforeExec
        exec(add_try_clause(dic[name], StopBeforeExec), dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]

def test_before_clause(name: str, dic : dict):
    if name in dic:
        dograderclause(name, dic)
    else:
        print((f"Grader 'evaluator' need a script declared in the key '{name}'. "
               + "See documentation related to this builder."),
              file = sys.stderr)
        sys.exit(1)

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
    dic['response'] = get_answers()

    test_before_clause('evaluator_before')
    test_before_clause('evaluator')
    test_before_clause('evaluator_after')
    
    if 'grade' not in dic:
        print(missing_grade_stderr, file=sys.stderr)
        sys.exit(1)
    
    if 'after' in dic:
        glob = {}
        exec(dic['after'],dic)
        exec("", glob)
        for key in glob: # Cette boucle sert a supprimer les valeurs entrées par défaut par la fonction exec
            if key in dic and dic[key] == glob[key]:
                del dic[key]
    
    output(dic['grade'][0], dic['grade'][1], dic)

