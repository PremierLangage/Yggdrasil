extends = /model/basic/checkbox.pl

title = Multiples de 3 (Checkbox)

before ==
import random as rd

right = [str(n) for n in range(50,100) if n % 3 == 0]
wrong = [str(n) for n in range(50,100) if n % 3 != 0]

nbchoices = 5
nbright = rd.randint(1, 4)
==

text ==
Parmi les nombres suivants, lesquels sont des multiples de 3 ?
==



