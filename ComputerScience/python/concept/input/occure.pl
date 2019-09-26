

author=Marc  & Dominique 
title= lecture d'un caractère

tag=input|print|variable

extends=/ComputerScience/python/template/soluce.pl
 

@ /builder/before.py [builder.py]

soluce==  
lettre=input()
if lettre in "{{MOT}}":
	print(lettre,"apparait dans {{MOT}}.")
else:
  	print(lettre,"n'apparait pas dans {{MOT}}.")

==

code==
# lecture au clavier, affectation
# ?? apparait dans {{MOT}}.
# ?? n'apparait pas dans {{MOT}}.
lettre=input()

==



text==
Ecrivez un programme utilisant une unique variable **lettre** qui lit un seul caractère au clavier 
et affiche s'il appartient ou non à la suite {{MOT}}

==

before==

import random 

lst=["aeiouy","abcxyz","python","=+$-*:"]
MOT= random.choice(lst)
a=MOT

import jinja2
soluce= jinja2.Template(soluce).render(globals())
code=  jinja2.Template(code).render(globals())
==


plsoluce==
Test 1 |a
Test 2 |i
Test 3 |n
Test 4 |+
==







