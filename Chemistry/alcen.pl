

title= Get me the molecule 

text==
Dessine un 
==

form=@ jsmolform.html

before==
import random
l=[("benzene","c1ccccc1"),("ethanol","cco"),("clorobenzene","Clc1ccccc1")]
exo=random.choice(l)
text+= exo[0]
smiles=exo[1]
==

grader=@ /grader/evaluator.py
evaluator==
if response['coucou']==smiles:
    grade=(100,"bravo")
else:
    grade=(0," C'est pas ça !c'est ca :"+response['coucou'])
==


builder=@ /builder/before.py
@ /utils/sandboxio.py
