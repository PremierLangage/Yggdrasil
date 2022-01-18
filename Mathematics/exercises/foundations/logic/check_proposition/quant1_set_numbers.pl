# AAV : Déterminer si une proposition logique est vraie.
extends = /model/basic/checkbox.pl

title = Déterminer si une proposition est vraie

before ==
n = 40
numbers = set(range(1, 41))
even = set(range(2, 41, 2))
odd = numbers.difference(even)
case = randint(1, 4)
k = randint(3, 4)
if case == 1:
    A = sample(odd, k)
elif case == 2:
    A = sample(odd, k)
else:
    A = sample(numbers, k)
minA = min(A)
maxA = max(A)
items=[]
indsol = []
k = 0
for q in [randint(0, 1), randint(2, 3), randint(4, 5), randint(6, 7)]:
    if q == 0:
        items.append(r"$! \exists x \in A,\ x \textrm{ est pair} !$")
        bv = any([x%2 == 0 for x in A])
    elif q == 1:
        items.append(r"$! \exists x \in A,\ x \textrm{ est impair} !$")
        bv = any([x%2 != 0 for x in A])
    elif q == 2:
        items.append(r"$! \forall x \in A,\ x \textrm{ est pair} !$")
        bv = all([x%2 == 0 for x in A])
    elif q == 3:
        items.append(r"$! \forall x \in A,\ x \textrm{ est impair} !$")
        bv = all([x%2 != 0 for x in A])
    elif q == 4:
        d = choice([randint(1, maxA), randint(maxA, n)])
        items.append(rf"$! \exists x \in A,\ x \ge {d} !$")
        bv = any([x >= d for x in A])
    elif q == 5:
        d = choice([randint(1, minA), randint(minA, n)])
        items.append(rf"$! \exists x \in A,\ x \le {d} !$")
        bv = any([x <= d for x in A])
    elif q == 6:
        d = choice([randint(1, minA), randint(minA, n)])
        items.append(rf"$! \forall x \in A,\ x \ge {d} !$")
        bv = all([x >= d for x in A])
    elif q == 7:
        d = choice([randint(1, maxA), randint(maxA, n)])
        items.append(rf"$! \forall x \in A,\ x \le {d} !$")
        bv = all([x <= d for x in A])
    if bv:
        indsol.append(k)
    k +=1

#A = FiniteSet(*A)
==

question ==
On considère l'ensemble 
$$ {{ A }}. $$
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==
