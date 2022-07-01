extends= /AAAA/Gaudet/template/cgbasic.pl

@/AAAA/Gaudet/template/cgbasicgrader.py

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 
lexemple =@exemple

#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]


title= Signaler Reparation

text==

{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est 145875 pour la question 1 
et 241861950 pour la question 2.

<details><summary>exemple</summary><blockquote>
  {{lexemple}}
</blockquote></details>

<details><summary>data</summary><blockquote>
  {{donnees}}
</blockquote></details>

Vous pouvez par exemple ecrire : 

    def Question1() :
        lignes  = sys.stdin.readlines()
        ...

==



before==
import build

data = build.builddata()

with open("ennonce1.md","r") as f:
    lenonce= f.read()

testcases, donnees = build.buildQ1(lexemple,data)

if testSuccess : 
    with open("ennonce2.md","r") as f:
        lenonce += f.read()
    testcases, donnees = build.buildQ2(lexemple,data)
==

grader == # Date : 17/06/2022
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

    # Final feedback
    output(testSuccess * 100 // len(testcases), feedback.render(), context)

==


editor.code ==
import sys
def Question1():
    array = [int(x[:-1]) for x in sys.stdin.readlines()]
    for i in range(len(array)):
            for j in range(i+1,len(array)):
                if array[i] + array[j] == 2020:
                    return array[i] * array[j]

def Question2():
    array = [int(x[:-1]) for x in sys.stdin.readlines()]
    for i in range( 0,len(array)-2): 
        for j in range(i + 1, len(array)-1): 
            for k in range(j + 1, len(array)):
                if array[i] + array[j] + array[k] == 2020:
                    return array[i] * array[j] * array[k]    
                    

if __name__ == '__main__':
    print(Question1())  

  
==