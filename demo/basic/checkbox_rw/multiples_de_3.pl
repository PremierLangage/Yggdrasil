extends = /model/basic/checkbox_rw.pl

title = Multiples de 7

before == #|py|
right = [str(n) for n in range(50, 100) if n % 3 == 0]
wrong = [str(n) for n in range(50, 100) if n % 3 != 0]
==

question ==
Parmi les nombres suivants, lesquels sont des multiples de 3 ?
==

nbitems = 4

minright = 2

maxright = 3