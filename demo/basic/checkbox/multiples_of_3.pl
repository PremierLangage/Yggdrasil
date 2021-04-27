extends = /model/basic/checkbox.pl

title = Multiples de 3

before ==
from random import sample
items = [3, 4, 5]
indsol = []
for i in range(items):
    if items[i] % 3 == 0:
        indsol.append(i)
==

text ==
Parmi les nombres suivants, lesquels sont des multiples de 3 ?
==