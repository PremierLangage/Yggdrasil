extends = /model/basic/dragdrop.pl

before==
numbers = []
sol = []
for i in range(4):
    a, b = sample(range(10, 100), 2)
    numbers.append([a, b])
    if a < b:
        sol.append("\>")
    else:
        sol.append("$! > !$")
==

question ==
Comparer les nombres suivants en utilisant le symbole adapté ({{ clabels[0] }} ou {{ clabels[1] }}).
==

inputblock ==
{% for i in range(nbdrops) %}
* {{ numbers[i][0] }} {{ cdrops[i] }} {{ numbers[i][1] }}
{% endfor %}
==