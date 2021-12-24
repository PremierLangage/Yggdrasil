extends = /model/basic/dragdrop.pl

before==
numbers = []
sol = []
for i in range(4):
    a, b = sample(range(10, 100), 2)
    numbers.append([a, b])
    if a < b:
        sol.append("\<")
    else:
        sol.append("\>")
==

question ==
Comparer les nombres suivants en utilisant le symbole adapté ({{ lab.comp[0]|component }} ou {{ lab.comp[1]|component }}).
{% for drop in drp.comp %}
* {{ numbers[loop.index0][0] }} {{ drop|component }} {{ numbers[loop.index0][1] }}
{% endfor %}
==
