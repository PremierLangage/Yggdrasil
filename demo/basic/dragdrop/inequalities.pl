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
{% for i in range[4] %}
* {{ numbers[i][0] }} {{ input.drops[i]|component }} {{ numbers[i][1] }}
{% endfor %}
==
