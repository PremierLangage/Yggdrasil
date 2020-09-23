# Non-testé parce que PL ne semble pas marcher pour le moment...
author=Wenjie Fang
title=Deux divisions

tag=input|print|variable|if|else|conditionnelles|type|operation

extends=/ComputerScience/python/template/soluce.pl
 

@ /builder/before.py [builder.py]

soluce==  
n=int(input())
m=int(input())
if m==0:
    print("Division par 0")
else:
    print(n, '/', m, '=', n/m)
    print(n, '=', m, '*', n//m, '+', n - (n//m)*m)
==

code==
# lecture au clavier, affectation
n=int(input())
m=int(input())
==



text==
Ecrivez un programme qui prend deux entiers **n** et **m** et qui calcule le résultat de **n** divisé par **m**, 
et aussi la division euclidienne de **n** par **m**. Si **m** est égal à 0, alors votre programme doit afficher "Division par 0".

**Exemple :**

Si **n**=10 et **m**=4, alors votre programme doit afficher

10 / 4 = 2.5

10 = 4 * 2 + 2

Si **n**=1 et **m**=4, alors votre programme doit afficher

1 / 4 = 0.25

1 = 4 * 0 + 1

Si **n**=9 et **m**=0, alors votre programme doit afficher

Division par 0
==

before==
==

plsoluce==
Test 1 |10 4
Test 2 |1 4
Test 3 |-1 5
Test 4 |100 3
Test 6 |10 0
Test 7 |0 0
==





