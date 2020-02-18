


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




title= Les lettres suivantes 

text==

Donnez les {{n}} lettre(s) suivante de {{l}} .

==

before==
import random 
l=chr(64+random.randint(1,25)) # pas de lettre après z

essais=0
==



evaluator==
import random
def reset():
    global title,essais,l
    title += "*"
    l=chr(64+random.randint(1,25)) # pas de lettre après z
    essais=0

essais += 1
if essais > 3:
    reset()
    grade=(0," trop de tentatives réessayer avec une autre lettre ")
elif len(inputbox.value)!= 1 or ord(inputbox.value)>ord('Z') :
        essais -= 1
        grade=(-1," saisissez une seule lettre Majuscule. ")
elif ord(l)+1 == ord(inputbox.value):
        reset()
        grade = (100, " Bravo vous avez utiliser "+str(essais)+" essais" )
else:
        grade=(0," réessayez il vous reste "+str(3-essais) + " essais" )

== 


