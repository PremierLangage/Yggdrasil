extends = basic.pl

input =: Input
input.type = text

before ==
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
sol=a+b
==

text ==
Calculer {{a}} + {{b}}.
==

form ==
{{ input | component }}
==

evaluator ==
try:
    n=int(input.value)
    if n==sol:
        score=100
    else:
        score=0
        feedback="La solution est %d." % sol
except:
    score=-1
    feedback="Votre réponse n'est pas compréhensible."
==


