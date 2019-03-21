title= Configuration Electronique 

author= Nous 

form=@ /form/simpletextform.html 

@ /builder/before.py [builder.py]

@ verif.py
grader=@ /grader/evaluator.py

@ /utils/sandboxio.py 

text="Quelle est la configuration éléctronique {{name}} "

before==
import random

table=[("du Carbone",8),("de l'Oxygène",10),("Azote",7)]
name, a = random.choice(table)
#random.randint(1,33)


==


evaluator==
import traceback
import sys

import verif


try: 
    if verif.verif(response['txt_answer'].lower(),a) :
        grade = (100, "Bonne réponse")
    else:
        grade = (0, "Mauvaise réponse Bonne réponse : "+verif.strfromz(a))
except:
    print(traceback.format_exc(), file=sys.stderr)
    grade = (-1, "Merci de rentrer un entier")
==



