
#!/usr/bin/env python3
# coding: utf-8
import sys, jsonpickle
from sandboxio import output, get_context, get_answers
from pltest_doc import CodingGamesTestRunner
import langhandlers

class StopBeforeExec(Exception):
    pass

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

    # Get context and checks 
    context = get_context()
    student_code = get_answers()['answer']

    if "pltest" not in context not in context :
        print("add  either pltest or pltest0..N , or change the template ", file=sys.stderr)
        sys.exit(1)
    if 'stopfirsterror' in context:
        stop = bool(context['stopfirsterror'])
    else:
        stop = False

    outstr=""

    # Get language used
    lang = 'c'
    language_handlers = {
        'c': langhandlers.CHandler,
        'python': langhandlers.PythonHandler
    }
    handler = language_handlers[lang](student_code)

    # Compilation
    handler.compile()

    # Tests execution
    if "pltest" in context:
        pltest = context['pltest']
        tester = CodingGamesTestRunner(pltest, handler.exec_cmd)
        testname = context['testname'] if 'testname' in context else "Groupe de test 1"
        a, b = tester.runtests(testname)
    else:
        a, b = True, ""
    outstr +=  b
    if "feedback" in context: # FIXME feedback devrai être un dictionnaire.
        outstr += context["feedback"] + " valeur de stop " + str(stop)
    
    # Rajout résultat dans JSON
    output(a, outstr)
