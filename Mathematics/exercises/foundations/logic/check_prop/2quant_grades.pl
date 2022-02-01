# Déterminer si une proposition logique élémentaire est vraie.
# Proposition avec deux quantificateurs, portant sur les éléments 
# d'un tableau de nombres.
# proposition logique, quantificateur

extends = /model/math/checkbox.pl

title = Déterminer si une proposition est vraie

before ==
nb_el = 4
nb_mat = 5
table = [[10 for _ in in range(nb_el)] for _ in range(nb_mat)] 

items, indsol = [], []

k = 0
for q in [randint(0, 1), randint(2, 3), randint(4, 5), randint(6, 7)]:

    case = randint(1, 4)
    if case == 1:
        A = sample(inveven, randint(3, neven))
    elif case == 2:
        A = sample(invodd, randint(3, nodd))
    else:
        A = sample(range(nf), randint(3, 4))
    minA, maxA = min([f[x] for x in A]), max([f[x] for x in A])
    latexA = r"\\{ " + latex(FiniteSet(*A)) + r" \\}"

    if q == 0:
        items.append(r"$! \exists x \in %s ,\ f(x) \textrm{ est pair} !$" % latexA)
        valprop = any([f[x]%2 == 0 for x in A])
    elif q == 1:
        items.append(r"$! \exists x \in %s,\ f(x) \textrm{ est impair} !$" % latexA)
        valprop = any([f[x]%2 != 0 for x in A])
    elif q == 2:
        items.append(r"$! \forall x \in %s,\ f(x) \textrm{ est pair} !$" % latexA)
        valprop = all([f[x]%2 == 0 for f[x] in A])
    elif q == 3:
        items.append(r"$! \forall x \in %s,\ f(x) \textrm{ est impair} !$" % latexA)
        valprop = all([f[x]%2 != 0 for x in A])
    elif q == 4:
        d = choice([randint(minA, maxA), randint(maxA, n)])
        items.append(r"$! \exists x \in %s,\ f(x) \ge %s !$" % (latexA, d))
        valprop = any([f[x] >= d for x in A])
    elif q == 5:
        d = choice([randint(1, minA), randint(minA, maxA)])
        items.append(r"$! \exists x \in %s,\ f(x) \le %s !$" % (latexA, d))
        valprop = any([f[x] <= d for x in A])
    elif q == 6:
        d = choice([randint(1, minA), randint(minA, maxA)])
        items.append(r"$! \forall x \in %s,\ f(x) \ge %s !$" % (latexA, d))
        valprop = all([f[x] >= d for x in A])
    elif q == 7:
        d = choice([randint(minA, maxA), randint(maxA, n)])
        items.append(r"$! \forall x \in %s,\ f(x) \le %s !$" % (latexA, d))
        valprop = all([f[x] <= d for x in A])
    if valprop:
        indsol.append(k)
    k += 1

==

question ==
On considère l'application $! f !$ définie par la table ci-dessous. </br>

<table>
<tr>
{% for i in range(nb_el) %}
<th> éléve {{i}} </th>
{% for j in range(nb_matl) %}
<td> {{ table[i][j] }} </td>
{% endfor %}
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
