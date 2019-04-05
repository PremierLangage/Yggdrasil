#!/usr/bin/env python3
# coding: utf-8
import sys, json, jsonpickle
if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    input_json = sys.argv[1]
    output_json = sys.argv[2]
    
    with open(input_json, "r") as f:
        with open(output_json, "w+") as g:
            g.write(f.read())
    
    sys.exit(0)
