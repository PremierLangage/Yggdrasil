
# Comments

# -*- coding: utf-8 -*-


import doctest
import subprocess
import re

def execute(args, instr):
    """
    :param args: the subprocess parameter
    :param instr: the input file for the subprocess parameter
    :return:
        boolean: code de retour 
        stdout
        stderr
    """
    try:
        p = subprocess.Popen(" ".join(args), stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,shell= True)
        sortieo,sortiee = p.communicate(input=instr.encode())
        return p.returncode == 0, sortieo.decode(),sortiee.decode() 
    except Exception as e:
        return False, " ".join(args), str(e)


def executefromstring(code, inputstr, filename="dummy.py"):
    """

    :param code: Write code to file to be able to execute it
    :param inputstr:
    :return: (execok,stdout,stderr)
    """
    with open(filename, "w") as f:
        f.write(code)
    return executefromfilename(filename, inputstr)


def executefromfilename(filename, input_str):
    """
    :param filename: name of file to execute
    :param input_str: input string
    :return: (bool,stdout,stderr)
    """
    return execute(["python3", filename], input_str)


def unitTestWithSoluce(testname, studentfilename, solucefilename, input_str, feedback ):
    """
    :param: test name for the feedback
    :param studentfilename: Must exist
    :param solucefilename: Must exist
    :param input_str:
    :param: the feedback object
    :return: if the test run smoothly
    """
    b, o, e = executefromfilename(solucefilename, input_str)
    if not b:
        """
        the soluce is not working !!!
        """
        feedback.addTestError("la soluce ne fonctionne pas", " Messages d'erreur \n "+ e,o)
        return False
    return unitTestWithOutput(testname, studentfilename, o, input_str, feedback )


def unitTestWithOutput(testname, studentfilename, outputstr, input_str, feedback ):
    """
    :param: test name for the feedback
    :param studentfilename: Must exist
    :param outputstr: to compare student execution output with
    :param input_str:
    :param:  feedback: feedback object
    :return: if the test run smoothly
    """

    xb, xo, xe = executefromfilename(studentfilename, input_str)
    if not xb:
        feedback.addTestError(testname, " Problèmes avec votre code \n " + xo + "\n" + xe, "")
        return False
    oc = doctest.OutputChecker()
    res = oc.check_output(outputstr, xo, doctest.NORMALIZE_WHITESPACE)
    reswhites = oc.check_output(outputstr, xo, 0)
    
    #print("inputstr:", input_str,"attendu:", outputstr)
    #print(" recu:",xo)
    nowhiteoutputstr=removewhitespace(outputstr)
    nowhitexo=removewhitespace(xo)
    nowhites=  oc.check_output(nowhiteoutputstr, nowhitexo, 0)
    case =  oc.check_output(nowhiteoutputstr.lower(), nowhitexo.lower(), 0)
    if reswhites :
        feedback.addTestSuccess(testname, xo, outputstr )
    elif res :
        feedback.addTestSuccess(" Attention quelques caractères invisibles en trop", xo, outputstr )
    elif nowhites:
        feedback.addTestFailure(" a part les espaces tout est bon", xo, outputstr )
    elif case:
        feedback.addTestFailure(" a part la case et les espaces tout est bon", xo, outputstr )
    else:
        r = oc.output_difference(doctest.Example(" le test", outputstr), xo,0)
        if r.startswith("Expected:") and "Got:" in r :
                want,got = r.split("Got:")
                want= want[9:]
        else:
                want=r
                got=""
        feedback.addTestFailure(testname,got,want)
    return reswhites or res

def removewhitespace(s):
    return re.sub(r'\s', '', s)  # elimination des espaces 

def runsolucetests(tests, feedback, studentfilename=None, solucefilename=None, flags=True):
    """
    :param tests: a list of tests (name, input_str)
    :param: feedback: feedback object to pass to tester
    :param studentfilename: if none student.py is used
    :param solucefilename: if none soluce.py is used 
    :return: 
    """
    studentfilename = studentfilename if studentfilename else "student.py"
    solucefilename = solucefilename if solucefilename else "soluce.py"
    res = 0
    for name, input_str in tests:
        ok =  unitTestWithSoluce(name, studentfilename, solucefilename, input_str, feedback)
        if not ok and flags:
           # FIXME break  # arret sur le premier tests invalide
           break
        if ok:
            res += 1
    
    return 100*(res//len(tests))

def runsOutputtests(tests, feedback, studentfilename=None, flags=0x1):
    """

    :param tests: a list of tests (name, inputstr, outputstr)
    :param: feedback: feedback object to pass to tester
    :param studentfilename: if none student.py is used
    :return: 
    """
    studentfilename = studentfilename if studentfilename else "student.py"
    res=0
    for name, input_str, output_str in tests:
        ok=   unitTestWithOutput(name, studentfilename, output_str, input_str, feedback)
        if not ok and flags:
            break  # arret sur le premier tests invalide 
        if ok:
            res += 1
            
    return int(100*(res/len(tests)))

if __name__=="__main__":
   lestest=[("premier","success"),("bas beau","failure"),("Une erreur ","error"),]
   import feedback2
   fb=feedback2.FeedBack()
   runsolucetests(lestest,fb)
   print(fb.render())















