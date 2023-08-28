




#!/usr/bin/env python3
# coding: utf-8
import sys, jsonpickle,re
from sandboxio import output, get_context, get_answers
from pltest_doc import PlRunner
from feedback2 import FeedBack 

class StopBeforeExec(Exception):
    pass


def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n    ...\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")

def docheck(taboo, answer):
    x = re.sub("(\"(.|\n)*\"|#.*)", "", answer) #enlève les commentaires et les chaînes de caractères
    # FIXME la chaine de caractère ""  letaboo "" est elle trouvée par la regex suivante ? 
    return re.search("(^"+taboo+"[\s(]|[^\"]+"+taboo+"[\s(])", x) != None


def checktaboo(taboo, answer):
    if "|" not in taboo :
        return docheck(taboo, answer), taboo
    x = re.sub("(\"(.|\n)*\"|#.*)", "", answer) #enlève les commentaires et les chaînes de caractères
    for motclef in taboo.split("|"):
    # FIXME la chaine de caractère ""  letaboo "" est elle trouvée par la regex suivante ? 
        if re.search("(^"+motclef+"[\s(]|[^\"]+"+motclef+"[\s(])", x) != None :
            return True, motclef
    return False, ""

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
    student = get_answers()['answer']
    with open("student.py","w") as ost:
        ost.write(student)
    if "taboo" in dic:
        t,mc = checktaboo(dic['taboo'], student)
        if t:
            output(0, "Le mot clef "+mc+" est proscrit.")
            sys.exit(1)

    if "pltest" not in dic and "pltest0" not in dic :
        print("add  either pltest or pltest0..N , or change the template ", file=sys.stderr)
        sys.exit(1)
    if 'stopfirsterror' in dic:
        stop=bool(dic['stopfirsterror'])
    else:
        stop=False

    outstr=""
    lfb = FeedBack()
    numgroup=0
    if "pltest" in dic:
        pltest = dic['pltest']
        tester = PlRunner(student,pltest, fb=lfb)
        testname = dic['testname'] if 'testname' in dic else "Groupe de test un"
        g, b = tester.runpltest(testname, numgroup)
        a = ( g == 100 )
    elif "pltest0" in dic:
        pltest = dic['pltest0']
        tester = PlRunner(student,pltest, fb=lfb)
        testname = dic['testname0'] if 'testname0' in dic else "Groupe de test 0"
        g, b = tester.runpltest(testname, numgroup)
        a = ( g == 100 )
    else:
        a,b= True, ""

    if "demo" in dic:
        b += "<div>"+lfb.toJson()+"</div>"
    numgroup=1
    i=1
    while "pltest"+str(i) in dic and (a or stop ) :
        outstr += b
        lfb = FeedBack()
        testi = PlRunner(student,dic["pltest"+str(i)],fb=lfb)
        tname='testname'+str(i)
        testname = dic[tname] if tname in dic else "Groupe de test "+str(i+1)
        r, b = testi.runpltest(testname,numgroup)
        a = a and r == 100 # au moins un test a échoué
        i=i+1
        numgroup = numgroup + 1
        if "demo" in dic:
            b += "<div>"+lfb.toJson()+"</div>"

    outstr +=  b
    if "feedback" in dic: # FIXME feedback devrai être un dictionnaire.
        outstr += dic["feedback"]+" valeur de stop :"+ str(stop)

    
    output(a,outstr)







