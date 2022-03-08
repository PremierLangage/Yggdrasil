extends = /model/math/checkbox.pl

title = Table de vérité

before ==
n=randint(20,30)
numbers=set(range(1,n+1))
even=set(range(2,n+1,2))
odd=numbers.difference(even)

row1 = ["V" if P[i] else "F" for i in range(4)]
row2 = ["V" if Q[i] else "F" for i in range(4)]
row3 = ["V" if R[i] else "F" for i in range(4)]
==

text ==
On considère

Parmi les propositions suivantes, laquelle est logiquement équivalente à $! T(P,Q) !$ ?
==

