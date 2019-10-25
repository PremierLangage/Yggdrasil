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

    if 'before' in dic:
        dic['StopBeforeExec'] = StopBeforeExec
        print(add_try_clause(dic['before'], StopBeforeExec), file=sys.stderr)
        exec(add_try_clause(dic['before'], StopBeforeExec),{}, dic)
    else:
        print(("Player 'before' need a script declared in the key 'before'."),file = sys.stderr)
        sys.exit(1)

    if 'buttons' not in dic:
        dic['buttons'] = ["submit","reroll"]

    if 'maxattempt' not in dic:
        dic['maxattempt'] = 1

    dic['attempt']=1

    if dic['maxattempt'] > 1:
        text0 = "<span class='badge badge-info'> Tentative <span class='badge badge-light'> {{attempt}} / {{maxattempt}} </span></span>"
        dic['title'] = dic['titl']+ " " + text0

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))

    sys.exit(0)


