extends = /model/basic/checkbox.pl

title = Multiples de 3

before ==
items = sample(range(50, 100), 5)
indsol = []
for i, num in enumerate(items):
    if num % 3 == 0:
        indsol.append(i)
==

question ==
Parmi les nombres suivants, lesquels sont des multiples de 3 ?
==