# Boris Jabot 10/09/2019 KO
author=Dominique Revuz

tag=error
title= Corrige Moi !
name= Mówisz po polsku ?
extends=/ComputerScience/python/template/soluce.pl
text==

Le programme python si dessous contient une erreur corrigez la pour passer à l'exercice suivant.

==

code==
nb=input('Entrer un nombre:')
message='Je connais '+ nb + ' langages de programmation'
print message
==

input0=2
output0==
Je connais 2 langages de programmation
==

compilehelp==
<p style="color:yellow;background:blue;font-size:14">print est une fonction en python3 il faut lui fournir ces paramêtres entre paranthèses.
</p>
==


feedback==
**print** est une fonction en python3 il faut lui fournir ces paramêtres entre paranthèses.
==
soluce==
nb=input('Entrer un nombre:')
message='Je connais '+ nb + ' langages de programmation'
print(message)

==
