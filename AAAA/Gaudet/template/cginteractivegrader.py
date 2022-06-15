#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, time
import langhandlers

from sandboxio import output, get_context, get_answers

def parseTestcases(testcases):
    result = []
    for testcase in testcases.strip().split('\n'):
        result.append(literal_eval(testcase.strip()))
    return result

async def test(cmd, *args):
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

async def runtests(testcases):
    for testcase in testcases:
        result, feedback = await test(*testcase)
        if result:
            print("Success")
        else:
            print("Failure:", feedback)

if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               +"Usage: python3 grader.py [input_json] [answer_jsonfile] [output_json] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    
    context = get_context()
    response = get_answers()
    editor = context['editor']

    student_code = response[editor.cid]['code']

    feedback = ''

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
        feedback += compile_feedback
        feedback += "</code></pre><div>"
        score = 0
    
    output(100, feedback, context)