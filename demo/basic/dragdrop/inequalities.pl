extends = /model/basic/dragdrop.pl

before==
numbers = []
sol = []
for i in range(4):
    a, b = sample(range(10, 100), 2)
    numbers.append([a, b])
    if a < b:
        sol.append("$! < !$")
    else:
        sol.append("$! > !$")
==

question ==
Comparer les nombres suivants en utilisant le symbole adapté ({{ lbl[0] }} ou {{ lbl[1] }}).
{% for i in range(nbdrops) %}
* {{ numbers[i][0] }} {{ drp[i] }} {{ numbers[i][1] }}
{% endfor %}
==

inputblock ==
<ul>
    {% for i in range(nbdrops) %}
    <li> {{ numbers[i][0] }} {{ drp[i] }} {{ numbers[i][1] }} </li>
    {% endfor %}
</ul>
==