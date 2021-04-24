extends = /model/basic/dragdrop.pl

before==

n = 4

numbers = []
sol = []
for _ in range(n):
    [a,b] = sample(range(10, 100), 2)
    numbers.append([a, b])
    if a < b:
        sol.append("$! < !$")
    else:
        sol.append("$! > !$")
==