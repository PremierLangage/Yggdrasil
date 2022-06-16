# Date : 16/06/2022
# Auteur : Clément Gaudet

# Grader pour le template cginteractive.pl

#!/usr/bin/env python3
# coding: utf-8

import sys
import langhandlers
from cginteractive import CGInteractiveBinary, InvalidCGBinaryExecution
from asyncio import run, Queue, gather, create_task
from ast import literal_eval
from feedback2 import FeedBack
from enum import Enum

from sandboxio import output, get_context, get_answers

class TestStatus(Enum):
    PASS = 1
    FAIL = 2
    ERROR = 3

async def test(cmd, *args):
    """Lance un test
        @param cmd commande pour lancer l'exécutable correspondant au programme soumis par l'étudiant
        @param feedback objet de type FeedBack pour y inscrire le résultat du test
        @param args arguments à ajouter à l'appel du script d'évaluation écrit par le professeur
        @return True si le test est passé, False sinon
    """
    result = False

    student = CGInteractiveBinary(cmd)
    await student.start()
    result = await evalscript(student, *args)
    await student.stop()
    return result

async def worker(queue, cmd, lst):
    while True:
        i, testcase = await queue.get()
        testargs, _ = testcase
        try:
            lst[i] = TestStatus.PASS if await test(cmd, *testargs) else TestStatus.FAIL
        except InvalidCGBinaryExecution as err:
            lst[i] = TestStatus.ERROR
        queue.task_done()

async def runtests(cmd, feedback, testcases):
    """Lance l'ensemble des test
        @param cmd commande pour lancer l'exécutable correspondant au programme soumis par l'étudiant
        @param feedback objet de type FeedBack pour y inscrire le résultat du test
        @param testcases liste de tuples de la forme (*args, testname) correspondant aux tests
        @return la note correspondante sur 100

    """
    results = [None for _ in range(len(testcases))]
    queue = Queue()
    for i, testcase in enumerate(testcases):
        queue.put_nowait((i, testcase))
    
    tasks = []
    for _ in range(5):
        task = create_task(worker(queue, cmd, results))
        tasks.append(task)
    
    await queue.join()

    for task in tasks:
        task.cancel()
    
    await gather(*tasks, return_exceptions=True)

    for (_, testname), result in zip(testcases, results):
        if result == TestStatus.PASS:
            feedback.addTestSuccess(testname, 'Validation', 'Validation')
        elif result == TestStatus.FAIL:
            feedback.addTestFailure(testname, 'Echec', 'Validation')
        elif result == TestStatus.ERROR:
            feedback.addTestError(testname, "Erreur : le programme n'a pas répondu.\nCauses particulières à considérer : boucle infinie, arrêt prématuré du programme \
                                            oubli d'un \n en fin d'écriture sur la sortie standard", 'Validation')
        else:
            raise AssertionError("Shouldn't be possible")
    
    return len(list(filter(lambda a: a == TestStatus.PASS, results))) * 100 // len(testcases)


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
    from random import *
    testcases = eval(testcases)

    # Run tests
    score = run(runtests(handler.exec_cmd, feedback, testcases))
    
    # Write result to context and serialise to output JSON
    output(score, feedback.render(), context)