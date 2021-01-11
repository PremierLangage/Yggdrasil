extends = /model/mathinput.pl

title= Somme finie

text==

Donner le résultat de la somme de {{i}} et {{n}}. 

==

before ==
expr=("n","n-1","n+1","2n+1","2n-1")
n = expr[rand_int(0,4)]
i = rand_int(0,5)

==

form ==
la somme    
{{ input1|component}}
==


# évaluer la réponse 
evaluator==

if int(input1.value) == n+i :
    grade=(100,"Bravo ")
    print("")
else:
    grade=(0," Raté recommencez "+str(input1.value))

==

