#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from sandboxio import get_context
from random import random as rd

class StopBeforeExec(Exception):
    pass


def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n    ...\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    output_json = sys.argv[2]
    
    dic = get_context()
    step=0
    dic['step']=0
    if 'before' in dic:
        print(add_try_clause(dic['before']+"\n"+dic['beforestep'], StopBeforeExec), file=sys.stderr)
        exec(add_try_clause(dic['before']+"\n"+dic['beforestep'], StopBeforeExec), dic)
    else:
        print(("Player 'before' need a script declared in the key 'before'."),file = sys.stderr)
        sys.exit(1)

    if 'buttons' not in dic:
        dic['buttons'] = ["submit","reroll"]

    if 'maxattempt' not in dic:
        dic['maxattempt'] = 1

    step=0
    dic['step']=0
    settings=dic['settings']
    lst=[]
    for i in range(settings['repetition']):
        if step == i:
            lst.append(r"<span class='badge badge-primary'> %s </span>" % str(i+1))
        else:
            lst.append(r"<span class='badge badge-secondary'> %s </span>" % str(i+1))

    dic['author'] = "<h4> %s </h4>" % " ".join(lst)

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))

    sys.exit(0)

