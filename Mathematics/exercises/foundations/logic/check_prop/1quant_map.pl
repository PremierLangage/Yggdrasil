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
x = 0
f = choices(list(even), k=randint(3, 4)) + choices(list(odd), k=randint(3, 4))
nf = len(f)

inveven = [x for x in range(nf) if f[x]%2 == 0]
invodd = [x for x in range(nf) if f[x]%2 == 1]

k = 3
if case == 1:
    A = sample(inveven, k)
elif case == 2:
    A = sample(invodd, k)
else:
    A = sample(range(nf), k)

minA, maxA = min([f[x] for x in A]), max([f[x] for x in A])
items, indsol = [], []
latexA = latex(FiniteSet(*A))
k = 0
for q in [randint(0, 1), randint(2, 3), randint(4, 5), randint(6, 7)]:
    if q == 0:
        items.append(r"$! \exists x \in %s ,\ f(x) \textrm{ est pair} !$" % latexA)
        valprop = any([f[x]%2 == 0 for x in A])
    elif q == 1:
        items.append(r"$! \exists x \in %s,\ x \textrm{ est impair} !$" % latexA)
        valprop = any([f[x]%2 != 0 for x in A])
    elif q == 2:
        items.append(r"$! \forall x \in %s,\ x \textrm{ est pair} !$" % latexA)
        valprop = all([f[x]%2 == 0 for f[x] in A])
    elif q == 3:
        items.append(r"$! \forall x \in %s,\ x \textrm{ est impair} !$" % latexA)
        valprop = all([f[x]%2 != 0 for x in A])
    elif q == 4:
        d = choice([randint(minA, maxA), randint(maxA, n)])
        items.append(r"$! \exists x \in %s,\ x \ge {d} !$" % latexA)
        valprop = any([f[x] >= d for x in A])
    elif q == 5:
        d = choice([randint(1, minA), randint(minA, maxA)])
        items.append(r"$! \exists x \in %s,\ x \le {d} !$" % latexA)
        valprop = any([f[x] <= d for x in A])
    elif q == 6:
        d = choice([randint(1, minA), randint(minA, maxA)])
        items.append(r"$! \forall x \in %s,\ x \ge {d} !$" % latexA)
        valprop = all([f[x] >= d for x in A])
    elif q == 7:
        d = choice([randint(minA, maxA), randint(maxA, n)])
        items.append(r"$! \forall x \in %s,\ x \le {d} !$" % latexA)
        valprop = all([f[x] <= d for x in A])
    if valprop:
        indsol.append(k)
    k += 1

==

question ==
On considère l'application $! f !$ définie par la table ci-dessous. </br>

<table>
<tr>
<th> $! x !$ </th>
{% for x in range(nf) %}
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
</br>
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

style.table ==
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table {
    margin: auto;
}
th, td {
  padding: 0.5em;
  text-align:center;
}
</style>
==