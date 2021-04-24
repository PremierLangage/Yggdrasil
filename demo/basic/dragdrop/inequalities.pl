

before==
import random as rd

lt="&lt;"
gt="&gt;"

n = 4

numbers = []
sol = []
for _ in range(n):
    [a,b] = rd.sample(range(10,100),2)
    numbers.append([a,b])
    if a < b:
        sol.append(lt)
    else:
        sol.append(gt)

label = Labels([lt,gt])
drop = Drops(n)
==