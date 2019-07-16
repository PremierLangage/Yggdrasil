#!/usr/bin/env python3
# coding: utf-8
import sys, json, jsonpickle, time, re
from sandboxio import output, get_context, get_answers

from gradesoluce import *

missing_evaluator_stderr = """\
The key 'evaluator' was not found in the context.
When using this grader, the PL must declare a script inside a key 'evaluator'. This script have
access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""
missing_grade_stderr = """\
'evaluator' did not declare the variable 'grade'. 
The script have access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""

def checktaboo(taboo, answer):
    x = re.sub("(\"(.|\n)*\"|#.*)", "", answer) #enlève les commentaires et les chaînes de caractères
    return re.search("(^"+taboo+"\s|[^\"]+"+taboo+"\s)", x) != None

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

    variables = re.findall(r"\b[a-z][ ]*=[ ]*", student)

    with open("student.py","w") as sf:
        sf.write(student)
    import feedback2
    fb=feedback2.FeedBack()
    ret=runsolucetests(lestest,fb)


    output(ret, " ".join(variables) + " " + fb.render())


