#!/usr/bin/env python3
# coding: utf-8

"""
Author : Antonin JEAN
Date : 19/05/2023

-*-
Before for statistics handling
Contains 3 clauses in order:
before_stat :   to handle statistics initialisation
before :        to handle data filling (in implemented file)
before_graph :  to handle graph displaying

Contact: ofghanirre@gmail.com
"""


import sys, json, jsonpickle
from sandboxio import get_context

class StopBeforeExec(Exception):
    pass


def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n    ...\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")

def dobuilderclause(name,dic):
        glob = {}
        dic['StopBeforeExec'] = StopBeforeExec
        exec(add_try_clause(dic[name], StopBeforeExec), dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]

def test_before_clause(name: str, dic : dict):
    if name in dic:
        dobuilderclause(name, dic)
    else:
        print((f"Builder 'before' need a script declared in the key '{name}'. "
               + "See documentation related to this builder."),
              file = sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    output_json = sys.argv[2]
    
    dic = get_context()
    test_before_clause('before_stat', dic)
    test_before_clause('before', dic)
    test_before_clause('before_post', dic)
    test_before_clause('before_graph', dic)

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)

