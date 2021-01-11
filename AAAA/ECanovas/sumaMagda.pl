extends = /model/mathinput.pl


title= Somme finie


text==

Donner le résultat de la somme de {{a}} et {{b}}. 

==

a % 3
b % 5

form ==
la somme    
{{ input1|component}}
==


# évaluer la réponse 
evaluator==

if int(input1.value) == a+b and int(input2.value) == a*b :
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

