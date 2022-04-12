extends = /model/basic/dropgroup.pl

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
Comparer les nombres suivants en utilisant le symbole adapté ({{ inputfield.labels[0]|html }} ou {{ inputfield.labels[1]|html }}).
==

inputblock ==
{% for i in range(4) %}
* {{ numbers[i][0] }}  {{ inputfield.drops[i]|html }} {{ numbers[i][1] }}
{% endfor %}
==
