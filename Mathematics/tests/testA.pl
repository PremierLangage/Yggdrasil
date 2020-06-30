extends = /model/mathinput.pl

title = Un pré

before ==
L = 10 * rd.randint(1,10)
l = 10 * rd.randint(1,10)
per = 2*(L+1)
==

text ==
Donner le périmètre d'un pré rectangulaire de longueur {{L}} m et de largeur {{l}} m.
==

input =: Input
input.type = number

form ==
{{input|component}}
==
