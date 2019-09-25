
        grade=(0,"""Pensez à conserver la variable
a# DR 25/09/2019 OK
#  Author: Jérémie LE BASTARD   Mail: jlebas01@etud.u-pem.fr
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py



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

component =: Input
component.type = number

form==
{{ component|component}}
==

evaluator==
grade = (100, component.value);
==







