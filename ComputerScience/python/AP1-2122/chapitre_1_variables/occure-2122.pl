
#author=Marc  & Dominique 

title= Lecture d'un caractère

tag=input|print|variable|if|elif|else|conditionnelles

extends=/ComputerScience/python/template/soluce.pl
 
@ /builder/before.py [builder.py]

soluce==  
lettre=input()
if lettre in "{{MOT}}":
	print(lettre,"apparait dans {{MOT}}")
else:
  	print(lettre,"n'apparait pas dans {{MOT}}")

==

code==
# lecture au clavier, affectation
lettre=input()
# Textes a utiliser pour faire l'affichage 
# ?? "apparait dans {{MOT}}"
# ?? "n'apparait pas dans {{MOT}}" 

==

text==
Ecrivez un programme utilisant des **if elif else** emboités et 
une unique variable **lettre** qui lit un seul caractère au clavier 
et affiche s'il appartient ou non à la suite : "{{MOT}}"

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

plsoluce==
Test 1 |a
Test 2 |i
Test 3 |n
Test 4 |+
==
