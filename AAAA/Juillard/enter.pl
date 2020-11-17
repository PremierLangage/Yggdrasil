
extends = /model/mathinput2.pl


title= Balise de titre 


# Avant que ce soit présenté à l'élève 
before==

a=3
b=6



==


text==
Donner le produit et somme de {{a}} et {{b}}. 

==


form ==
la somme    
{{ input1|component}}
le produit
{{ input2|component}}
==



# évaluer la réponse 
evaluator==

grade=(100,"Bravo ")
==



