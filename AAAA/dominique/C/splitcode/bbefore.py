

#!/usr/bin/env python3
# coding: utf-8

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
        # print(add_try_clause(dic[name], StopBeforeExec), file=sys.stderr)
        r = compile(add_try_clause(dic[name], StopBeforeExec),"Before: "+name,"exec")
        exec(r, dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]


if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    output_json = sys.argv[2]
    
    dic = get_context()

    listofbefores=[]
    for key in dic.keys():
        if key.startswith('before') and key != 'before' :
            listofbefores.append(key)
    
    listofbefores.sort() # This is the order of execution defined by the lexicographical order 

    for beef in listofbefores :
        dobuilderclause(beef,dic)

    # the before with no suffixes is the last one 
    if 'beforesplit' in dic:
        dobuilderclause('beforeB',dic)

    if 'before' in dic:
        dobuilderclause('before',dic)
    elif not listofbefores:
        print(("Builder 'before' need a script declared in the key 'before'. "
               + "See documentation related to this builder."),
              file = sys.stderr)
        sys.exit(1)

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)

