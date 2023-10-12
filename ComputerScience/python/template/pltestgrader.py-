#!/usr/bin/env python3
# coding: utf-8
import sys, jsonpickle, re
from sandboxio import output, get_context, get_answers
from pltest_doc import PlRunner


missing_evaluator_stderr = """\
The key 'evaluator' was not found in the context.
When using this grader, the PL must declare a script inside a key 'evaluator'. This script have
access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""
missing_grade_stderr = """\
'evaluator' did not declare the variable 'grade'. 
The script have access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""
if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               + "Usage: python3 grader.py [input_json] [output_json] [answer_file] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)

    
    dic = get_context()
    if "pltest" not in dic and "pltest0" not in dic and "pltest1" not in dic:
        print("add  either pltest or pltestN , or change the template ", file=sys.stderr)
        sys.exit(1)
    if 'stopfirsterror' in dic:
        stop=bool(dic['stopfirsterror'])
    else:
        stop=False
    student = get_answers()['answer']
    outstr=""
#    if "pltestbuilder" in dic:
#        if "soluce" not in dic:
#                print(" illegal use of pltestbuilder sql soluce is empty", file=sys.stderr)
#                sys.exit(1)
#        import pltestbuilder
#        tester = SQLPlRunner(student,dic["soluce"])
#        a, b = tester.runpltest(1)
#    elif
    if "pltest" in dic:
        pltest = dic['pltest']
        tester = PlRunner(student,pltest)
        a, b = tester.runpltest(1)
    elif "pltest0" in dic:
        pltest = dic['pltest0']
        tester = PlRunner(student,pltest)
        a, b = tester.runpltest(1)
    else:

        a,b= True, ""
    i=1
    while "pltest"+str(i) in dic and (a or stop ) :
        outstr += b
        testi = PlRunner(student,dic["pltest"+str(i)])
        a, b = testi.runpltest(i+1)
        i=i+1

    outstr +=  b
    if "feedback" in dic: # FIXME feedback devrai être un dictionnaire.
        outstr += dic["feedback"]+" valeur de stop "+ str(stop)
    output(a,outstr)
    


