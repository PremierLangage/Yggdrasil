extends = /model/basic.pl

title = Addition

before ==
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
==

text ==
Calculer {{a}} + {{b}}.
==

input =: Input
input.type = number

form ==
{{ input | component }}
==

settings.feedback = rightwrong

evaluator ==
if input.value == a+b:
    grade=(100,"")
else:
    grade=(0,f"La réponse est {a+b}.")
==


