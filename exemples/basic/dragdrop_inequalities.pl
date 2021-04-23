extends = /model/basic/dragdrop.pl

title ==
Comparaison de nombres (DragDrop)
==

contents ==
$! < !$
$! > !$
==

before ==
import random as rd

numbers = []
sol = []
nbdrops = 4
for _ in range(nbdrops):
    [a, b] = rd.sample(range(10, 100), 2)
    numbers.append([a, b])
    if a < b:
        sol.append("$! < !$")
    else:
        sol.append("$! > !$")
==

text==
Comparer les nombres suivants avec les symboles {{ labels[0] | component }} et {{ labels[1] | component }}.
==

form==
<ul>
{% for i in range(nbdrops) %}
<li> {{ numbers[i][0] }} {{ drops[i]|component }} {{ numbers[i][1] }} </li>
{% endfor %}
</ul>
==


