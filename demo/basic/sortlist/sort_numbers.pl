extends = /model/basic/sortlist.pl

title = Nombres

question ==
Classer les nombres suivants du plus petit au plus grand.
==

before ==
sortedlist = list(range(1, 100))
==

nbitems % 5
