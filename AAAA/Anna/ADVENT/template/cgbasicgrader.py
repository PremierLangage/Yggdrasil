# Date : 17/06/2022
# Auteur : Clément Gaudet

# Grader pour le template cgbasic.pl

import sys, langhandlers, subprocess
from sandboxio import output, get_context, get_answers
from feedback2 import FeedBack

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
    if 'testcases' not in context :
        print('testcases missing, please specify tests to run', file=sys.stderr)
        sys.exit(1)

    # Get language used and the corresponding handler
    lang = response[editor.cid]['language']
    handler = langhandlers.get_language_handler(lang, student_code)

    feedback = FeedBack(name="Tests")

    # Compilation
    success, compile_feedback = handler.compile()
    if not success:
        feedback.addTestSyntaxError('Compilation', compile_feedback.replace('\n', '<br>'), 'La compilation du code a échoué')
        output(0, feedback.render(), context)
        sys.exit(1)

    # Execution of tests
    from random import *
    from pathlib import *
    testcases = eval(context['testcases'])
    testSuccess = 0

    for test, want, name in testcases:
        try:
            
            # If input is the name of a file, it loads the file into the stdin
            if len(test)<22:
                q = Path(test)
                if q.exists() :
                    with q.open() as f:
                        test = f.read()
            proc = subprocess.run(handler.exec_cmd, input=test, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                text=True, timeout=1)
        except subprocess.TimeoutExpired:
            feedback.addTestError(name, "Erreur : l'exécution a pris trop de temps" , want)
        else:
            if proc.returncode == 0:
                if proc.stdout.strip() == want.strip():
                    feedback.addTestSuccess(name, proc.stdout.strip(), want.strip())
                    testSuccess += 1
                else:
                    feedback.addTestFailure(name, proc.stdout.strip(), want.strip())
            else:
                feedback.addTestError(name, "Erreur à l'exécution (code de retour " + str(proc.returncode) + ")\nSortie d'erreur : " + proc.stderr, want)
    
    # Execute 'postevaluator' script if it's set for question 2
    if 'postevaluator' in context and context['changeText'] == False:
        if testSuccess * 100 // len(testcases) == 100:
            glob = {}
            exec(context['postevaluator'], context)

            # Remove keys related to general execution context
            exec("", glob)
            for key in glob:
                if key in context and context[key] == glob[key] and key != 'text':
                    del context[key]


    # Final feedback
    output(testSuccess * 100 // len(testcases), feedback.render(), context)