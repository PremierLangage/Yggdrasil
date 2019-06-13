# Copyright 2017 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
name=sisi004.pl
title= IF ELIF ELSE
tag= input|else|if|elif|bool|and|or|paranthesis
extends=/ComputerScience/python/template/soluce.pl
text==

Ecrire un programme qui demande à l’utilisateur trois entiers a,b et c par exemple:

	31
	14
	17

Et qui utilise un seul test if et affiche **OUI** si

	a > 12 et b >12
	ou bien si
	 c <20

Sinon affiche **NON**

==

code==
a,b,c=input().split(' ')
a,b,c=int(a),int(b),int(c)

print("OUI")
print("NON")
==

plsoluce==
a=12 b=66 c=23  |12 66 23
a=12 b=12 c=12 |12 12 12
a=1 b=6 c=123 |1 6 123
a=66 b=77 c=88 |66 77 88
==

soluce==
a,b,c=input().split(' ')
a,b,c=int(a),int(b),int(c)

if (a>12 and b >12) or c<20 :
    print("OUI")
else:
    print("NON")
==



