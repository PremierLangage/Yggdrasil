




@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Démo MathInput

before ==
import random
lop=[(" plus ","+"),("moins","-"),("divisé par ","//"),("mutiplié par ","*")]

optxt,op = random.choice(lop)

if op=="+" :
    v1= random.randint(10000,100000)
    v2= random.randint(10000,100000)
elif op=="-":
    v1= random.randint(10000,100000)
    v2= random.randint(10000,100000)
elif op=="//":
    v1= random.randint(10000,100000)
    v2= random.randint(10,100)
elif op=="*":
    v1= random.randint(1000,10000)
    v2= random.randint(1000,10000)
==

text ==
Calculer {{v1}}  {{optxt}} {{v2}} chère Ines. 
==

input =: MathInput

form ==
{{ input | component }}
==

evaluator ==

result= eval(str(v1)+op+str(v2))
if input.value== result:
    grade=(100,"bravo Ines")
else:
    grade=(0,"Ressaye Ines")
==


