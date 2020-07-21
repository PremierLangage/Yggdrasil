title = Un pré
author = Sophie Lemaire
input0=: Input
input0.type = number

before==
L = 10 * rd.randint(1 , 10)
l = 10 * rd.randint(1 , 10)
per = 2 * (L + l)

==

text==
Donner le périmètre d'un pré rectangulaire de longueur $!{{L}}!$ m et de largeur $!{{l}}!$ m.
==

form==
périmètre (en m)
{{input0|component}}

==

evaluator==
score=0
if input0.value == per:
	score += 100

==

