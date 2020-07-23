extends = /model/mathinput.pl
title = Un pré
author = Sophie Lemaire
input =: Input
input.type = number

before ==
L = 10 * rd.randint(1,10)
l = 10 * rd.randint(1,10)
per = 2 * (L + l)
==

text ==
Donner le périmètre d'un pré rectangulaire de longueur {{L}} m et de largeur {{l}} m.
==



form ==
périmètre (en m)
{{input|component}}
==

evaluator ==
if input.value == per:
    score = 100
else:
    score = 0
==
