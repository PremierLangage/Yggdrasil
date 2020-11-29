
extends = basic.pl

title= Addition Aléatoire

author = Quentin

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox


text==
La fonction $!f:\mathbb R \to \mathbb R_+!$, $!x\mapsto \exp(x)!$ est-elle injective ?  
try count = {{ nb_attempt }}
==

form ==
{{ checkbox|component }}
==


before ==#|python|
# Some globals variables
import random as rd

nb_attempt=0
Good = ['Vrai']
Bad = ['Faux']
checkbox.setdata_from_rw(Good, Bad)
==

evaluator==
nb_attempt += 1
score =  checkbox.eval()
feedback= " " 
grade=(score,feedback)
==
@ /utils/sandboxio.py












