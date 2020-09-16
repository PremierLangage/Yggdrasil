author=WF
title=Distinguer le six !

tag=input|print|variable|if|elif|else|conditionnelles

extends=/ComputerScience/python/template/soluce.pl
 

@ /builder/before.py [builder.py]

soluce==  
n=int(input())
if n > 6:
	print("Trop grand !")
elif n < 6:
    print("Trop petit !")
else:
  	print("Tout juste !")
==

code==
# lecture au clavier, affectation
nombre=int(input())
==



text==
Ecrivez un programme utilisant des **if elif else** emboités et 
une unique variable **nombre** qui lit un nombre du clavier et qui le compare avec 6.

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


