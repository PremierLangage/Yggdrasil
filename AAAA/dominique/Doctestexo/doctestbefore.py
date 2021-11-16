
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


def double_with_tab(str):
    return "\n\t".join(str.split("\n"))


if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    output_json = sys.argv[2]
    
    dic = get_context()

    if 'before' in dic:
        glob = {}
        #dic['StopBeforeExec'] = StopBeforeExec
        #exec(add_try_clause(dic['before'], StopBeforeExec), dic)
        exec(dic['before'],dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]
    else:
        print(("Builder 'before' need a script declared in the key 'before'. "
               + "See documentation related to this builder."),
              file = sys.stderr)
        sys.exit(1)

    #dic['text']=f"""Soit la version 1 de la fonction :\n<br/><br/>\n\n\n {double_with_tab(dic['f1'])} \n<br/><br/>\n\n\n  et la version 2 de la fonction :<br/><br/>\n\n\n  {double_with_tab(dic['f2'])}<br/><br/>\n\n\n  Ecrivez un doctest qui 'passe' pour premièer version  et qui échoue pour deuxième."""
    dic['text']="Soit la version 1 de la fonction :\n<br/><br/>\n\n\n " + double_with_tab('\n'+dic[f1]+'\n') + " \n<br/><br/>\n\n\n  et la version 2 de la fonction :<br/><br/>\n\n\n" + double_with_tab(dic['f2']) + "<br/><br/>\n\n\n  Ecrivez un doctest qui 'passe' pour premièer version  et qui échoue pour deuxième."

    dic['text'] += "porout"
    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)

