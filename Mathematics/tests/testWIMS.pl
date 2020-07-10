extends = /model/mathinput.pl
title = Un pré (units)
input0=: Input
input0.type = text
input1=: Input
input1.type = text

before==
L = 10 * rd.randint(1 , 10)
l = 10 * rd.randint(1 , 10)
per = 2 * (L + l)
super = L * l

==

text==
Donner le périmètre et la superficie d'un pré rectangulaire de longueur {{L}} m et de largeur {{l}} m
==

form==
périmètre
{{input0|component}}
superficie
{{input1|component}}

==

evaluator==
if input0.value == str(per) + " m":
	score = 100
else:
	score = 0
if input1.value == "super m ^ 2":
	score = 100
else:
	score = 0

==
