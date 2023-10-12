#!/usr/bin/env python3
# coding: utf-8
import sys, jsonpickle,re
from sandboxio import output, get_context, get_answers
from pltest_doc import PlRunner
from feedback2 import FeedBack 

import sys
import threading

try:
    import thread
except ImportError:
    import _thread as thread

def cdquit():
    thread.interrupt_main() # raises KeyboardInterrupt

def runtest_with_timout(runner,name, number, duree=1):
    if duree == 0:
        return runner.runpltest(name,number)
    try:
        timer = threading.Timer(duree, cdquit)
        timer.start()
        try:
            result = runner.runpltest(name,number)
            # result = (grade,feedback)
        finally:
            timer.cancel()
        return result
    except KeyboardInterrupt:
        runner.fb.addTestError(name,"","Trop de temps de calcul plsu de "+str(duree)+" secondes")
        return 0,result[1] # result of execute code is False if it's ends after timeout

        


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

    if 'stopfirsterror' in dic:
        stop=bool(dic['stopfirsterror'])
    else:
        stop=False



    # build liste
    listoftests= []
    if "pltest" in dic:
        if "pltest0" in dic:
            print("add either pltest or pltest0..N , or change the template ", file=sys.stderr)
            sys.exit(1)
        dic["pltest0"]=dic["pltest"]
        listoftests.append("pltest0")
    elif "pltest0" in dic:
        listoftests.append("pltest0")
    else:
        print("add either pltest or pltest0..N , or change the template ", file=sys.stderr)
        sys.exit(1)
    i=1
    while "pltest"+str(i) in dic :
        listoftests.append("pltest"+str(i))
        i = i+1


    if "timeout" in  dic:
        try:
            timeout=int(dic["timeout"])
        except Exception :
            timeout = 1
    else:
        timeout=0

    # do the tests from the list
    a= True # Tout c'est bien passé jsuque la ;)
    outstr="" # pas de feedback poiur le moment 
    lfb = None # une structure feedback pour chaque test
    nbgt = len(listoftests) 
    nbpts=0
    for i,testgroupid in enumerate(listoftests):
        pltest= dic[testgroupid]
        lfb = FeedBack()
        tname='testname'+str(i)
        testname = dic[tname] if tname in dic else "Groupe de test "+str(i+1)
        
        runner = PlRunner(student,dic[testgroupid],fb=lfb)
        r,b = runtest_with_timout(runner,testname,i+1, timeout)
        # r, b = runner.runpltest(testname,i+1)
        outstr +=  b # Ajout au feedbakc final 
        nbpts += r
        a = a and r == 100 # si au moins un test a échoué r != 100

        if stop and r <100: # si sortir au premier groupe de tests échoué 
            break
        if "demo" in dic:
            b += "<div>"+lfb.toJson()+"</div>"
        
    if "feedback" in dic: # FIXME feedback devrai être un dictionnaire.
        outstr += dic["feedback"]+" valeur de stop :"+ str(stop)

    if a:
        grade= 100
    else:
        grade= nbpts/nbgt

    output(grade,outstr)







