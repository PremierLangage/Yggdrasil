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

f = choices(even, k=randint(3, 4)) + choices(odd, k=randint(3, 4))
shuffle(f)

k = randint(3, 4)
if case == 1:
    A = sample(odd, k)
elif case == 2:
    A = sample(odd, k)
else:
    A = sample(numbers, k)

minA, maxA = min(A), max(A)
items, indsol = [], []

k = 0
for q in [randint(0, 1), randint(2, 3), randint(4, 5), randint(6, 7)]:
    if q == 0:
        items.append(r"$! \exists x \in A,\ x \textrm{ est pair} !$")
        valprop = any([x%2 == 0 for x in A])
    elif q == 1:
        items.append(r"$! \exists x \in A,\ x \textrm{ est impair} !$")
        valprop = any([x%2 != 0 for x in A])
    elif q == 2:
        items.append(r"$! \forall x \in A,\ x \textrm{ est pair} !$")
        valprop = all([x%2 == 0 for x in A])
    elif q == 3:
        items.append(r"$! \forall x \in A,\ x \textrm{ est impair} !$")
        valprop = all([x%2 != 0 for x in A])
    elif q == 4:
        d = choice([randint(minA, maxA), randint(maxA, n)])
        items.append(rf"$! \exists x \in A,\ x \ge {d} !$")
        valprop = any([x >= d for x in A])
    elif q == 5:
        d = choice([randint(1, minA), randint(minA, maxA)])
        items.append(rf"$! \exists x \in A,\ x \le {d} !$")
        valprop = any([x <= d for x in A])
    elif q == 6:
        d = choice([randint(1, minA), randint(minA, maxA)])
        items.append(rf"$! \forall x \in A,\ x \ge {d} !$")
        valprop = all([x >= d for x in A])
    elif q == 7:
        d = choice([randint(minA, maxA), randint(maxA, n)])
        items.append(rf"$! \forall x \in A,\ x \le {d} !$")
        valprop = all([x <= d for x in A])
    if valprop:
        indsol.append(k)
    k += 1

A = FiniteSet(*A)
==

question ==
On considère l'ensemble 
{{ f }}
$$ {{ A|latex }}. $$
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

