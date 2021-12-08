#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, time

from components import Component

if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               +"Usage: python3 grader.py [input_json] [answer_jsonfile] [output_json] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    
    with open(sys.argv[1], "r") as f:
        dic = json.load(f)
    Component.sync_context(dic)
    #dic['response'] = get_answers()

    if 'evaluator' in dic:
        glob = {}
        exec(dic['evaluator'], dic)
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
    
    with open(sys.argv[3], "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    with open(sys.argv[4], "w+") as f:
        print(str(dic['grade'][1]), file=f)
    
    print(int(dic['grade'][0]))
    
    sys.exit(0)