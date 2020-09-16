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

code==# lecture au clavier, affectation
nombre=int(input())
==



text==
Ecrivez un programme utilisant des **if elif else** emboités et 
une unique variable **nombre** qui lit un nombre du clavier et qui le compare avec 6.

Si **nombre** est plus grand que 6, ton programme

==

before==

import random 

lst=["aeiouy","abcxyz","cassepieds","=+$-*:","Python"]
MOT= random.choice(lst)
a=MOT

import jinja2
soluce= jinja2.Template(soluce).render(globals())
code=  jinja2.Template(code).render(globals())
==


plsoluce0==
Test 1 |a
Test 2 |i
==

plsoluce1==
Test 3 |n
Test 4 |+
==

