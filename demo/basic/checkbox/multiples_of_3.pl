extends = /model/basic/checkbox.pl

title = Multiples de 3

before ==
items = sample(range(50, 100), 6)
for i in range(items):
    if items[i] % 3 == 0:
        indsol.append(i)
==

text ==
Parmi les nombres suivants, lesquels sont des multiples de 3 ?
==