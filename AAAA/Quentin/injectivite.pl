
extends = /model/basic/vraifaux.pl


author = Quentin


title= Injectivité

text==
La fonction $!f:\mathbb R \to \mathbb R_+!$ $!x\mapsto \exp(x)!$ est-elle injective ?  
==


answer=Non


# pour aligner les propositions 
horizontal % true 

feedback_correct ==
Bonne réponse
==
feedback_wrong = Mauvaise réponse.
general_feedback==


evaluator==
import traceback
import sys

try: 
    c += 1
    if int(response['answer']) == op1 + op2:
        grade = (100, "Bonne réponse")
    else:
        grade = (0, "Mauvaise réponse")
except:
    print(traceback.format_exc(), file=sys.stderr)
    grade = (-1, "Merci de rentrer un entier")
==


before==
import random
random.seed(seed)
op1 = random.randint(1, 10)
op2 = random.randint(1, 10)
c = 0
==

@ /utils/sandboxio.py
@ ../../../lib/builder/before.py [builder.py]
@ ../../../lib/grader/evaluator.py [grader.py]








