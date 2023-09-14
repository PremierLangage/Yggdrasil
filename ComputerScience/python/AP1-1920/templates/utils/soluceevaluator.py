
#!/usr/bin/env python3
# coding: utf-8
import sys, json, jsonpickle, time, random, os
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
if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               + "Usage: python3 grader.py [input_json] [output_json] [answer_file] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)


    dic = get_context()
    if "plsoluce" not in dic and "mplsoluce0" not in dic :
        print("No plsoluce or mplsoluce0 in dic  necessary for this template " , file=sys.stderr)
        sys.exit(1)
    if "soluce" not in dic and not  os.path.exists("soluce.py"):
        print("No soluce or file soluce.py  necessary for this template " , file=sys.stderr)
        sys.exit(1)
    if not  os.path.exists("soluce.py") and "soluce" in dic:
        with open("soluce.py","w") as sol:
            sol.write(dic['soluce'])
    lestest=[]
    if "plsoluce" in dic:
        for i,line in enumerate(dic['plsoluce'].split("\n")):
            if line != "" : # problem with finishing empty line
                if len(line.split('|')) != 2 :
                    print(" to many | ",len(line.split('|')) ,"in test line ",i,": ", str(beurkl), file=sys.stderr)
                    sys.exit(1)
                lestest.append(line.split('|'))
    else:
        for u in range(0,10): # FIXME IF U >10
            xname = "mplsoluce"+str(u)
            if xname not in dic:
                continue # Skip
            mpvalue=dic[xname].split("\n")
            lestest.append([mpvalue[0],"\n".join(mpvalue[1:])])
    
    student = get_answers()['answer']
    with open("student.py","w") as sf:
        sf.write(student)
    import feedback2
    fb=feedback2.FeedBack()
    ret=runsolucetests(lestest,fb)
    output(ret, fb.render())









