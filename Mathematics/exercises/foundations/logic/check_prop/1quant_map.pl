# Déterminer si une proposition logique élémentaire est vraie.
# Proposition avec un seul quantificateur, portant sur les éléments 
# d'un ensemble fini de nombres (parité, inégalité)
# proposition logique, quantificateur

extends = /model/math/checkbox.pl

title = Déterminer si une proposition est vraie

before ==
n, m = 40, 5
numbers = set(range(m, n - m + 1))
even = set(range(0, n + 1, 2)).intersection(numbers)
odd = set(range(1, n + 1, 2)).intersection(numbers)
case = randint(1, 4)

f = choices(list(even), k=randint(3, 4)) + choices(list(odd), k=randint(3, 4))
n = len(f)

==

question ==
On considère l'application
<table>
<tr>
<th> $! x !$ </th>
{% for x in range(n) %}
<td> {{ x }} </td>
{% endfor %}
</tr>
<tr>
<th> $! f(x) !$ </th>
{% for fx in f %}
<td> {{ fx }} </td>
{% endfor %}
</tr>
</table>
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

