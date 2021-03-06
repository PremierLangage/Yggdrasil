# Boris Jabot 11/09/2019 OK
# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
title= lecture d'un entier
name=Age du Capitaine 
tag=input|print|variable

extends=/ComputerScience/python/template/soluce.pl

text==
Ecriver un programme utilisant une unique variable **age** qui lit cette information au clavier puis affiche :

	Le capitaine a ?? ans. Dans deux ans il aura ?? ans.

puis sachant que dans cinq ans, le perroquet aura le tiers de l’âge du capitaine (arrondi à l'année inférieur) quel est l'age actuel du perroquet, le programme affiche:

	Le perroquet du capitaine a ?? ans.

Les opérateurs de python permettent d'écrire des expressions complexes et rapides.<br>
Il n'est pas nécessaire de avoir un nom pour toutes les valeurs intermédiaires des calculs. 
== 

code==
# lecture au clavier et transformation en entier puis affectation
age=int(input())
# Le capitaine a __ ans. Dans deux ans il aura __ ans.
# Le perroquet du capitaine à __ ans.
==

feedback==

==

plsoluce==
Test 1 |33
Test 2 |66
Test 3 |100000
==

soluce==
a=int(input())
print("Le capitaine a %d ans. Dans deux ans il aura %d ans." % (a,a+2))
print("Le perroquet du capitaine a %d ans." % (((a+5)//3)-5))
==





