#!/usr/bin/env python3
# coding: utf-8

# Grader pour le template type Coding Games

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
    editor_id = context["editor"].cid
    answers = get_answers()
    student_code = answers[editor_id]['code']
    
    if "cgtest" not in context :
        print("cgtest missing, please specify tests to run", file=sys.stderr)
        sys.exit(1)

    feedback = ""

    # Get language used and the corresponding handler
    lang = answers[editor_id]['language']
    language_handlers = {
        'c': langhandlers.CHandler,
        'python': langhandlers.PythonHandler,
        'java': langhandlers.JavaHandler
    }
    if lang not in language_handlers:
        raise ValueError(lang + " language not supported")

    handler = language_handlers[lang](student_code)

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

    else:
        # Test execution
        if "cgtest" in context:
            cgtest = context['cgtest']
            tester = CodingGamesTestRunner(cgtest, handler.exec_cmd)
            testname = context['testname'] if 'testname' in context else "Groupe de test 1"
            score, test_feedback = tester.runtests(testname)
        else:
            score, test_feedback = True, ""
        feedback += test_feedback
        
    # Rajout résultat dans JSON
    output(score, feedback)
