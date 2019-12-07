extends = /Mathematics/template/mathradio.pl

title = Table de vérité

before ==
if randint(1,2)==1:
    P=[True,True,False,False]
    Q=[True,False,True,False]
else:
    P=[False,False,True,True]
    Q=[False,True,False,True]

choices = ["$!P!$ et non ($!Q!$)","$!P!$ ou non ($!Q!$)","non ($!P!$) et $!Q!$","non ($!P!$) ou $!Q!$"]
case=randint(0,3)
if case==0:
    R = [P[i] and not Q[i] for i in range(4)]
elif case==1:
    R = [P[i] or not Q[i] for i in range(4)]
elif case==2:
    R = [not P[i] and Q[i] for i in range(4)]
elif case==3:
    R = [not P[i] or Q[i] for i in range(4)]

radio.loadContent(choices)
radio.setSolByIndex(case)

row1 = ["V" if P[i] else "F" for i in range(4)]
row2 = ["V" if Q[i] else "F" for i in range(4)]
row3 = ["V" if R[i] else "F" for i in range(4)]
==

text ==
On considère

Parmi les propositions suivantes, laquelle est logiquement équivalente à $! T(P,Q) !$ ?
==

