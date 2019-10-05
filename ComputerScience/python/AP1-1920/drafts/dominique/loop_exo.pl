

extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

@ loopgen.py
title= Boucle d'OR (repetable)


text==
Lire un entier sur l'entré dans la variable X.

X est toujours positif.

Affichez les entiers  de {{b}} à {{b}}+X parcourus de {{s}} en {{s}} 
{{predtext}}

et calculez {{operatortextb}} {{functeur[0]}} {{operatortexta}} .
==

plsoluce==
Vérification 1 | 100
Vérification 2 | 10
Vérification 3 |777
==

soluce==
import random
import loopgen
import functools

random.seed(seed)
predicats,functeurs,operators= loopgen.getStuff()
b=random.randint(-100,100)
h=b+int(input())
s= random.randint(1,7) if h>b else random.randint(-3,-1)
predcode,predtext = random.choice(predicats)
functeur = random.choice(functeurs)
operatorcode,operatortextb,operatortexta = random.choice(operators)
l = [o for o in range(b,h,s) if predcode(o)]
st= [str(o) for o in range(b,h,s) if predcode(o)]
import sys
if st :
    print("\n".join(st))
else:
    print()
#print(str(predcode))
result=operatorcode( functools.reduce(functeur[2],l, functeur[1]))
print(result)
==

student==
s=0
p=1
X=int(input())
a= -70
diviseur=3
step= 6
for i in range(a,a+X+1,step):
    if i%diviseur==0:
        s+=i
        p*=i
        print(i)
# print(s//2)
# print(s*s)
# print(s**3)
# print(p//2)
# print(p**2)
# print(p**3)

==


before==
import random
import loopgen
import functools
result=0
while result==0 :
    seed=random.randint(1,10000)
    random.seed(seed)
    predicats,functeurs,operators= loopgen.getStuff()
    b=random.randint(-100,100)
    #h=b+random.randint(-10,100)
    h=b+100
    s= random.randint(1,7) if h>b else random.randint(-3,-1)
    predcode,predtext = random.choice(predicats)
    functeur = random.choice(functeurs)
    operatorcode,operatortextb,operatortexta = random.choice(operators)

    result=operatorcode( functools.reduce(functeur[2],[o for o in range(b,h,s) if predcode(o)], functeur[1]))


soluce="seed={}\n".format(seed)+soluce

==
