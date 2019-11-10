extends = /template/sortlist.pl

title = Ordonner des nombres

before ==
import random as rd
numbers=rd.sample(list(range(50)),5)
numbers.sort()
sortlist.loadContent([str(n) for n in numbers])
==

text ==
{{numbers}}
Ordonner les nombres suivants du plus petit au plus grand.
==
