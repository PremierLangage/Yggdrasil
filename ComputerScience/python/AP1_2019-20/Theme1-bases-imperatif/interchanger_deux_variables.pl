# Boris Jabot 10/09/2019 OK
#  Author: Jérémie LE BASTARD   Mail: jlebas01@etud.u-pem.fr
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before== #|python|
import random
random.seed(seed)

a = random.randint(1,10)
b = random.randint(1,10)

a1 = a
b1 = b
==


evaluator== #|python|

exec(response['answer'])
if a == b1 and a1 == b :
    grade = (100,'OK')
else :
    grade = (0,'NUL')
==

title== #|html|
Echange de variables
==


text== #|html|
Le but de cet exercice est d'interchanger les valeurs de a et b en Python. Ex :  a = 3 , b = 7, on souhaite que a prenne la valeur de b et b la valeur de a.

Les variables a et b sont déjà déclarées et ont une valeur aléatoire.
==

form=@ /form/text_editor.html





