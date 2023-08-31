# author=Wenjie Fang

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
Ecrivez un programme utilisant un **if elif else** et 
une unique variable **nombre** qui lit un nombre du clavier et qui le compare avec 6.

- Si **nombre** est plus petit que 6, votre programme doit afficher "Trop petit !".
- Si **nombre** est exactement 6, votre programme doit afficher "Tout juste !".
- Si **nombre** est plus grand que 6, votre programme doit afficher "Trop grand !".
==

before==
==

plsoluce==
Test 1 |10
Test 2 |6
Test 3 |6
Test 4 |-2
==





extends = /ComputerScience/python/template/pltest.pl
# author = Zip
tag=function
title = Valeur absolue

text==
Ecrivez une fonction `comparaison` ayant un unique paramètre `nombre` utilisant un **if elif else** retournant la chaîne de caractères:

- "Trop petit !", si `nombre` est plus petit que 6.
- "Tout juste !", si `nombre` est exactement 6.
- "Trop grand !", si `nombre` est plus grand que 6.
Exemples :

	>>> comparaison(7)
    'Trop grand !'
    >>> comparaison(-5)
    'Trop petit !'
==

editor.code==


==

pltest==
>>> comparaison(7)
'Trop grand !'
>>> comparaison(-5)
'Trop petit !'
==


pltest1==
>>> val_abs(4) == 4
True
==

Xeditor.code==
def val_abs(x):
    if x<0:
        x=-x # Fixme pourquoi j'aime pas cette solution car si le type de x est un peu plus compliqué on a changé sa valeur 
        # en faisant un effet de bord return -x c'est mieux non ?
    return x
==
