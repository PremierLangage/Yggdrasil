#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, time
import langhandlers
from cginteractive import CGInteractiveBinary, InvalidCGBinaryExecution
from asyncio import run
from ast import literal_eval
from feedback2 import FeedBack

from sandboxio import output, get_context, get_answers

def parseTestcases(testcases):
    result = []
    for testcase in testcases.strip().split('\n'):
        args, name = testcase.split('#')
        if not name:
            name = 'Test sans nom'
        result.append(literal_eval(args.strip()), name.strip())
    return result

async def test(cmd, feedback, *args):
    """Lance un test
        @param cmd commande pour lancer l'exécutable correspondant au programme soumis par l'étudiant
        @param feedback objet de type FeedBack pour y inscrire le résultat du test
        @param args arguments à ajouter à l'appel du script d'évaluation écrit par le professeur
        @return True si le test est passé, False sinon
    """
    result = False

    student = CGInteractiveBinary(cmd)
    await student.start()

    try:
        result = await evalscript(student, *args)
    except InvalidCGBinaryExecution as err:
        result = False

    await student.stop()
    return result

async def runtests(cmd, feedback, testcases):
    """Lance l'ensemble des test
        @param cmd commande pour lancer l'exécutable correspondant au programme soumis par l'étudiant
        @param feedback objet de type FeedBack pour y inscrire le résultat du test
        @param testcases liste de tuples de la forme (*args, testname) correspondant aux tests
    """
    for testcase in testcases:
        testargs, testname = testcase
        result = await test(cmd, feedback, *testargs)
        if result:
            feedback.addTestSuccess(testname, 'pass', 'pass')
        else:
            feedback.addTestFailure(testname, 'fail', 'pass')

if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               +"Usage: python3 grader.py [input_json] [answer_jsonfile] [output_json] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    
    # Get all required data from context
    context = get_context()
    response = get_answers()
    editor = context['editor']

    student_code = response[editor.cid]['code']

    if 'evalscript' not in context:
        print("evalscript is not defined, please supply an evalscript", file=sys.stderr)
        sys.exit(1)
    evalscript = context['evalscript']

    if 'testcases' not in context:
        print("testcases is not defined, please supply testcases", file=sys.stderr)
        sys.exit(1)
    testcases = context['testcases']

    feedback = FeedBack(name="Tests")

    # Get language used and the corresponding handler
    lang = response[editor.cid]['language']
    handler = langhandlers.get_language_handler(lang, student_code)

    # Compilation
    success, compile_feedback = handler.compile()
    if not success:
        feedback.addTestSyntaxError('Compilation', compile_feedback.replace('\n', '<br>'), 'La compilation du code a échoué')
        output(0, feedback.render(), context)
        sys.exit(1)
    
    # Load eval script
    dic = {}
    exec(evalscript, dic)
    evalscript = dic.get('evalscript', None)
    if evalscript is None:
        raise ValueError("Failed to load eval script")

    # Load test cases
    testcases = parseTestcases(testcases)

    # Run tests
    run(runtests(handler.exec_cmd, feedback, testcases))
    
    # Write result to context and serialise to output JSON
    output(100, feedback.render(), context)