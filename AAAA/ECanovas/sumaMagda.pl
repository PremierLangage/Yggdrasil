extends = /model/mathinput.pl

title= Somme finie

text==

Donner le résultat de la somme de {{a}} et {{b}}. 

==

before ==
n = rand_int(2,11)
i = rand_int(1,5)
expr = P * Q
==

form ==
la somme    
{{ input1|component}}
==


# évaluer la réponse 
evaluator==

if int(input1.value) == a+b :
    grade=(100,"Bravo ")
    print("")
else:
    grade=(0," Raté recommencez "+str(input1.value))

==


reserve==
# Avant que ce soit présenté à l'élève 
    before==


    a=3
    b=6

    ==
==

