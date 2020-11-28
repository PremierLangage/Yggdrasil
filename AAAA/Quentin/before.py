
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


if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)

    output_json = sys.argv[2]
    dic = get_context()

    if "settings" in dic and "requirements" in dic['settings']:
            ok=True
            for key in dic['settings']['requirements'].split(","):
                if "|" in key:
                    maybe=False
                    for k in key.split("|"):
                        if k in dic:
                            maybe=True
                    if not maybe:
                        print(f"Clef {key} manquante ", file=sys.stderr)
                        ok=False
                elif key not in dic:
                    ok=False
                    print(f"Clef {key} manquante ", file=sys.stderr)
            if not ok:
                sys.exit(1)


    if 'before' in dic:
        glob = {}
        dic['StopBeforeExec'] = StopBeforeExec
        print(add_try_clause(dic['before'], StopBeforeExec), file=sys.stderr)
        exec(add_try_clause(dic['before'], StopBeforeExec), dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]
    else:
        print(("Builder 'before' need a script declared in the key 'before'. "
               + "See documentation related to this builder."),
              file = sys.stderr)
        sys.exit(1)

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)




