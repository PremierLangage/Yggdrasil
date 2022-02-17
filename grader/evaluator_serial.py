#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, time

from sandboxio import output, get_context, get_answers


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

    from components import Component
    with open(sys.argv[1], "r") as f:
        dic = json.load(f)

    #Component.sync_context(context)
    answers = get_answers()

    def deserialize(d):
        if isinstance(d, dict):
            for k, v in d.items():
                if isinstance(v, dict) and 'cid' in v:
                    cid = v['cid']
                    d[k] = Component.deserialize(Component.deserialize(v, v), answers[cid])
                else:
                    deserialize(v)
        elif isinstance(d, list):
            for i in range(len(d)):
                if isinstance(d[i], dict) and 'cid' in d[i]:
                    cid = d[i]['cid']
                    d[i] = Component.deserialize(d[i], d[i])
                else:
                    deserialize(d[i])

    deserialize(dic)

    if 'evaluator' in dic:
        glob = {}
        dic['StopEvaluatorExec'] = StopEvaluatorExec
        exec(add_try_clause(dic['evaluator'], StopEvaluatorExec), dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]
    else:
        print(missing_evaluator_stderr, file=sys.stderr)
        sys.exit(1)

    if 'grade' not in dic:
        print(missing_grade_stderr, file=sys.stderr)
        sys.exit(1)
    
    output(dic['grade'][0], str(answers), dic)

