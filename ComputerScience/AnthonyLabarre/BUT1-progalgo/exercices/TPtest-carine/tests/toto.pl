
@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]



title== #|html|
Somme de variables
==

text== #|html|
Initialisez la variable **somme** avec la somme des variables **a** et **b** (qui existent déjà).
==


form==
<input id="form_answer" type="number" value="{{ answers__.answer }}" required/>
==

op1 = 32
op2 = 26

evalfunc==
import traceback
import sys

def evalfunc(dic, answers):
    try: 
        if int(answers['answer']) == dic['op1'] + dic['op2']:
            return (100, "Bonne réponse")
        return (0, "Mauvaise réponse")
    except:
        print(traceback.format_exc(), file=sys.stderr)
        return(-1, "Merci de rentrer un entier")
==