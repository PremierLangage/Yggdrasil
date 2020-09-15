
extends = /model/basic/sortlist.pl

text ==
Classer les nombres suivants du plus petit au plus grand.
==

before ==
import random as rd
sortedlist = sorted(rd.sample(range(1, 100), 5))
==
