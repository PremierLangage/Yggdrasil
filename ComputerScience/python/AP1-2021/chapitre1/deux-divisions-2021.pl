# Non-testé parce que PL ne semble pas marcher pour le moment...
author=Wenjie Fang
title=Deux divisions

tag=input|print|variable|if|else|conditionnelles|type

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
Ecrivez un programme utilisant des **if elif else** 

- Si **nombre** est plus petit que 6, votre programme doit afficher "Trop petit !".
- Si **nombre** est exactement 6, votre programme doit afficher "Tout juste !".
- Si **nombre** est plus grand que 6, votre programme doit afficher "Trop Grand !".
==

before==
==

plsoluce0==
Test 1 |10
Test 2 |6
==

plsoluce1==
Test 3 |6
Test 4 |-2
==
