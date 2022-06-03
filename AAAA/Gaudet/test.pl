extends = /model/basic/radio.pl

title = "Test"

before ==
from random import randint
nombres = [randint(100) for i in range(4)]
sol = min(nombres)
==

question ==
Quel est le plus petit nombre?
==

items = nombres

indsol = nombres.index(sol)