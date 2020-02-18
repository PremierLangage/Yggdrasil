


extends=basic.pl

exopl==
Exercice de programmation PL:
1) Ecrire un exercice demandant la lettre de l’alphabet suivant une lettre donnée et
permettant au plus trois essais.
==

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Answer
inputbox.maxlength = 1
inputbox.appearance = outline
form==
{{ inputbox|component}}
==




title= La lettre suivante 

text==

Donner la lettre suivante de {{l}} .

==

before==
import random 
l=chr(64+random.randint(1,25)) # pas de lettre après z

essais=0
==



evaluator==
essais += 1
if essais > 3:
    essais=0
    l=chr(64+random.randint(1,25))
    grade=(0," trop de tentatives réessayer avec une autre lettre ")
else:
    if ord(l)+1 == ord(inputbox.value):
        grade = (100, " Bravo ")
    else:
        grade=(0," réessayez il vous reste "+str(3-essais) + " essais" )

== 


