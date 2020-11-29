
extends = /model/basic.pl

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
mult3 = ['Vrai']
other = ['Faux']

checkbox.setdata_from_rw(mult3, other)
==
evaluator==
nb_attempt += 1
score =  checkbox.eval()
==

aernfs==
grade_checks = min([((score*100) // (nb_good+nb_bad)) , (100 // (2**nb_bad))])
grade_attempt = 50 + (200 // (3+nb_attempt))
grade=((grade_checks * grade_attempt) // 10000, feedback)
==

@ /utils/sandboxio.py











