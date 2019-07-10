#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, time
from sandboxio import output, get_context, get_answers

from gradesoluce import *

if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               + "Usage: python3 grader.py [input_json] [output_json] [answer_file] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)

    dic = get_context()
    if "plsoluce" not in dic:
        print("No plsoluce in dic  necessary for this template " , file=sys.stderr)
        sys.exit(1)
    if "soluce" not in dic and not os.exist("soluce.py"):
        print("No soluce or file soluce.py  necessary for this template " , file=sys.stderr)
        sys.exit(1)
    if "soluce" in dic:
        with open("soluce.py","w") as sol:
            sol.write(dic['soluce'])
    lestest=[]
    for i,line in enumerate(dic['plsoluce'].split("\n")):
        if line != "" : # problem with finishing empty line
            if len(line.split('|')) != 2 :
                print(" to many | ",len(line.split('|')) ,"in test line ",i,": ", str(beurkl), file=sys.stderr)
                sys.exit(1)
            lestest.append(line.split('|'))
    student = get_answers()['answer']
    with open("student.py","w") as sf:
        sf.write(student)
    import feedback2
    fb=feedback2.FeedBack()
    ret=runsolucetests(lestest,fb)


    output(ret, fb.render())
