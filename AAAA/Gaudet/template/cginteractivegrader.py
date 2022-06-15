#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, time
import langhandlers
from cginteractive import CGInteractiveBinary, InvalidCGBinaryExecution
from asyncio import run
from ast import literal_eval

from sandboxio import output, get_context, get_answers

def parseTestcases(testcases):
    result = []
    for testcase in testcases.strip().split('\n'):
        result.append(literal_eval(testcase.strip()))
    return result

async def test(cmd, feedback, *args):
    result = False
    feedback = ''

    student = CGInteractiveBinary(cmd)
    await student.start()

    try:
        result = await evalscript(student, *args)
        if not result:
            feedback = 'Student code failed to pass the test'
    except InvalidCGBinaryExecution as err:
        feedback = 'Student code evaluation failed:\n' + str(err)

    await student.stop()
    return result, feedback

async def runtests(cmd, feedback, testcases):
    for testcase in testcases:
        result, feedback = await test(cmd, feedback, *testcase)
        if result:
            print("Success", file=sys.stderr)
        else:
            print("Failure:", feedback, file=sys.stderr)

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

    # Get language used and the corresponding handler
    lang = response[editor.cid]['language']
    handler = langhandlers.get_language_handler(lang, student_code)

    # Compilation
    success, compile_feedback = handler.compile()
    if not success:
        feedback += """<div style="border:1px solid black;padding:1%;margin:1%;background-color:Tomato;border-radius:4px;color:black;">
        La compilation/vérification du code a échoué<br>
        Voici le détail:
        <pre style="background: #DDD"><code>
        """
        feedback = compile_feedback
        feedback += "</code></pre><div>"
        output(0, feedback, context)
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
    run(runtests(handler.exec_cmd, testcases))
    
    output(100, feedback, context)