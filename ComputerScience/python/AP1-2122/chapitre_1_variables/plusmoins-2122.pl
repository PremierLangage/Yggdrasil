# Wenjie Fang 23/09/2020 Espaces symétrisés
# Boris Jabot 11/09/2019 KO
# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>

# author=Dominique Revuz 

title=Manipulation de nombres
name= a+b+c+d
tag=input|print
extends=/ComputerScience/python/AP1-1920/templates/prosoluce.pl

before=

text==
Ecrire un programme qui demande à l’utilisateur de saisir quatre entiers au clavier (un par ligne), affiche ensuite une valeur par ligne,
 puis leur somme et leur moyenne sur la ligne suivante. Par exemple, si l’utilisateur entre les valeurs
	12, 3, 14 et 5,
le programme affiche :
	
	12
	3
	14
	5
	somme = 34 , moyenne = 8.5

<u>**Information**</u> : Soyez vigilant aux espaces. Par exemple pour "somme = 34", vous devez écrire somme<u>**espace**</u>=<u>**espace**</u>34 
== 

code==
# somme=??, moyenne=??
==

feedback==
Bravo
==
fff==
Deux solutions :<br>
	print("somme = ",somme," , moyenne = " ,moyenne)<br>
ou la syntaxe avec % mais attention c'est un float<br>
	print("somme = %d , moyenne = %f" % (somme,moyenne))
==

inputgenerator==
from random import randint 
print(randint(3,7)+4)
print(randint(3,7)+4)
print(randint(3,7)+4)
print(randint(3,7)+4)
==

mplsoluce0==
Test1
12
3
14
5
==



mplsoluce5==
Test génial
12
3333
1411
5111
==


soluce==
a=int(input())
b=int(input())
c=int(input())
d=int(input())
print(a)
print(b)
print(c)
print(d)
s=a+b+c+d

print("somme =", s ,", moyenne =", s/4)
==







