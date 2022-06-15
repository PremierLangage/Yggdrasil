#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from sandboxio import get_context

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

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)
