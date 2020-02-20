extends = /template/sortlist.pl

title = Ordonner des nombres

before ==
import random as rd
numbers = rd.sample(list(range(1,100)),5)
numbers.sort()
sortlist.loadlist([str(n) for n in numbers])
==

text ==
Ordonner les nombres suivants du plus petit au plus grand.
==


settings.feedback.class = score





