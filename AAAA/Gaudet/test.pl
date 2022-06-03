extends = /model/basic/radio.pl

title = "Test"

before ==
from random import randint
nombres = [randint(0, 100) for i in range(4)]
sol = min(nombres)
indsol = nombres.index(sol)
items = nombres
==

question ==
Quel est le plus petit nombre?
==