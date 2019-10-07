# DR 25/09/2019 OK
#  Author: Jérémie LE BASTARD   Mail: jlebas01@etud.u-pem.fr
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py

# Script d'évaluatino 
evaluator== #|python|
import random
random.seed(seed)


b = random.randint(1,10)
a=b+1

a1 = a
b1 = b
try:
    exec(response['answer'])
except Exception as e:
    grade=(0,""" Votre code ne compile pas""")
else:
    if a == b1 and a1 == b :
        grade = (100,'OK')
    elif a==b:
        grade=(0,"""Pensez à conserver la variable
        que vous écrasez en premier dans une autre variable temporaire.""")
    else:
        grade = (0,"""Vous devez manipuler les variables a et b.""")
==

title== #|html|
Echange de variables
==


text== #|html|
Le but de cet exercice est d'interchanger les valeurs de a et b en Python. 
Ex : si  a = 3 , b = "mot", on souhaite que a prenne la valeur de b et b la valeur de a.

Les variables a et b sont déjà déclarées et ont une valeur aléatoire.
Votre mission écrire du code qui fait que le contenu des deux variables a et b est échangé.

Remarque le code suivant qui semble a priori répondre à la question n'est pas bon.

    a="mot"
    b= 3


==

form=@ /form/text_editor.html









