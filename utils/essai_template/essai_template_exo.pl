extends = /model/basic.pl

custom_pl_template = /utils/essai_template/custom_template.html

title = Essai d'un nouveau template d'exo

before==
import random as rd

[a,b] = rd.sample(range(1,100),2)

==

text==
Le quel de ces deux nombres préférez-vous : {{ a }} ou {{ b }} ?
==

form==

{{ inputbox|component}}

==

settings.feedback = lightscore

evaluator==
if inputbox.value == str(a) : 
    grade (100, 'pas mal!')
else:
    grade = (0, 'c'est nul!')
==









