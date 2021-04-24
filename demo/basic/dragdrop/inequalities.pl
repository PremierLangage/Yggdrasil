extends = /model/basic/dragdrop.pl

before==
numbers = []
sol = []
for i in range(4):
    [a,b] = sample(range(10, 100), 2)
    numbers.append([a, b])
    if a < b:
        sol.append("$! < !$")
    else:
        sol.append("$! > !$")
==

form ==
<ul>
    {% for i in range(nbdrops) %}
    <li> {{ numbers[i][0] }} {{ drop [i] }} {{ numbers[i][1] }} </li>
    {% endfor %}
</ul>
==