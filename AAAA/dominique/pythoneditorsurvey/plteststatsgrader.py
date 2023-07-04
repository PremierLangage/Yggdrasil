



#!/usr/bin/env python3
# coding: utf-8

"""
Author : Antonin JEAN
Date : 22/05/2023

-*-
Evaluator for statistics handling
Contains 3 clauses in order:
evaluator_before :  toload answers data
evaluator :         to handle score / feedback settings (in implemented file)
evaluator_after :   to push answers in DB

Contact: ofghanirre@gmail.com
"""

import sys, json, jsonpickle, time

from sandboxio import output, get_context, get_answers
import sys, jsonpickle,re
from pltest_doc import PlRunner


missing_grade_stderr = """\
'evaluator' did not declare the variable 'grade'. 
The script have access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]. Negative grade means an error has occured, and can be handled by the script"""

class StopEvaluatorExec(Exception):
    pass


def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n    ...\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")

def dograderclause(name,dic):
        glob = {}
        dic['StopEvaluatorExec'] = StopEvaluatorExec
        exec(add_try_clause(dic[name], StopEvaluatorExec), dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]

def test_evaluator_clause(name: str, dic : dict):
    if name in dic:
        dograderclause(name, dic)
    else:
        print((f"Grader 'evaluator' need a script declared in the key '{name}'. "
               + "See documentation related to this builder."),
              file = sys.stderr)
        sys.exit(1)


def doPlTest(dic):  
    if 'stopfirsterror' in dic:
        stop=bool(dic['stopfirsterror'])
    else:
        stop=False
        
    if "pltest" in dic:
        pltest = dic['pltest']
        tester = PlRunner(student,pltest)
        testname = dic['testname'] if 'testname' in dic else "Groupe de test un"
        a, b = tester.runpltest(testname)
    elif "pltest0" in dic:
        pltest = dic['pltest0']
        tester = PlRunner(student,pltest)
        testname = dic['testname0'] if 'testname0' in dic else "Groupe de test 0"
        a, b = tester.runpltest(testname)
    else:

        a,b= True, ""
    i=1
    while "pltest"+str(i) in dic and (a or stop ) :
        outstr += b
        testi = PlRunner(student,dic["pltest"+str(i)])
        tname='testname'+str(i)
        testname = dic[tname] if tname in dic else "Groupe de test "+str(i+1)
        a, b = testi.runpltest(testname)
        i=i+1

    outstr +=  b
    if "feedback" in dic: # FIXME feedback devrai être un dictionnaire.
        outstr += dic["feedback"]+" valeur de stop "+ str(stop)
    output(a,outstr)








if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               +"Usage: python3 grader.py [input_json] [answer_jsonfile] [output_json] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    
    dic = get_context()
    dic['response'] = get_answers()

    student = get_answers()['answer']
    with open("student.py","w") as ost:
        ost.write(student)


    test_evaluator_clause('evaluator_before', dic)
    # test_evaluator_clause('evaluator', dic) # no evluator this is a pltest exercice

    doPlTest(dic)

    test_evaluator_clause('evaluator_after', dic)
    
    if 'grade' not in dic:
        print(missing_grade_stderr, file=sys.stderr) 
        sys.exit(1)
    
    output(dic['grade'][0], dic['grade'][1], dic)