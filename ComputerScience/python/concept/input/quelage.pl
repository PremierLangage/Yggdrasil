# Boris Jabot 11/09/2019 KO
# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
title= Quel age à le capitaine
tag=input|print|variable
extends=/ComputerScience/python/template/soluce.pl
name=Capitaine
text==
# input and print

Demandez au Capitaine son année de naissance puis calculez et affichez son age au 31 décembre 2018 à Minuit.

  Le capitaine né en ?? auras ?? ans en 2018.
== 

code==
# 
annee=int(input())
# Le capitaine né en __ auras __ ans en 2018.

==

feedback==
Ok top passons à quelque chose de plus dur ;). 
==

showinput=true
inputgenerator==
from random import randint 
print(randint(10,78)+1939)
==

soluce==
a=int(input())
print("Le capitaine né en %d auras %d ans en 2018." % (a,2018-a))
==


