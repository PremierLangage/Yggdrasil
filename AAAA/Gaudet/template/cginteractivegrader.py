#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, time

from sandboxio import output, get_context, get_answers

if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               +"Usage: python3 grader.py [input_json] [answer_jsonfile] [output_json] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    
    context = get_context()
    context['response'] = get_answers()

    student_code = response[editor.cid]['code']
    if 'cgtest' not in globals() :
        print('cgtest missing, please specify tests to run', file=sys.stderr)
        sys.exit(1)

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
    
    output('score', 'feedback', context)