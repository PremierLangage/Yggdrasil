
#!/usr/bin/env python3
# coding: utf-8
import sys, jsonpickle
from sandboxio import output, get_context, get_answers
from cgtest import CodingGamesTestRunner
import langhandlers

if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               + "Usage: python3 grader.py [input_json] [output_json] [answer_file] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)

    # Get context and checks 
    context = get_context()
    student_code = get_answers()['answer']

    if "cgtest" not in context :
        print("add  either cgtest, or change the template ", file=sys.stderr)
        sys.exit(1)

    feedback = ""

    # Get language used
    lang = 'python'
    language_handlers = {
        'c': langhandlers.CHandler,
        'python': langhandlers.PythonHandler
    }
    handler = language_handlers[lang](student_code)

    # Compilation
    success, compile_feedback = handler.compile()
    if not success:
        raise ValueError

    # Test execution
    if "cgtest" in context:
        cgtest = context['cgtest']
        tester = CodingGamesTestRunner(cgtest, handler.exec_cmd)
        testname = context['testname'] if 'testname' in context else "Groupe de test 1"
        a, b = tester.runtests(testname)
    else:
        a, b = True, ""
    feedback +=  b
    
    # Rajout résultat dans JSON
    output(a, feedback)
