extends = /Mathematics/template/mathcheckbox.pl

title = Table de vérité

before ==


checkbox.loadContent(choices)
checkbox.setSolByIndex(case)

row1 = ["V" if P[i] else "F" for i in range(4)]
row2 = ["V" if Q[i] else "F" for i in range(4)]
row3 = ["V" if R[i] else "F" for i in range(4)]
==

text ==
On considère

Parmi les propositions suivantes, laquelle est logiquement équivalente à $! T(P,Q) !$ ?
==

