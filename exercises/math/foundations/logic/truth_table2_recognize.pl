extends = /model/math/radio.pl

title = Table de vérité

before ==
if randint(1,2)==1:
    P=[True,True,False,False]
    Q=[True,False,True,False]
else:
    P=[False,False,True,True]
    Q=[False,True,False,True]

items = ["$!P!$ et non ($!Q!$)","$!P!$ ou non ($!Q!$)","non ($!P!$) et $!Q!$","non ($!P!$) ou $!Q!$"]
indsol = randint(0,3)
if indsol ==0:
    R = [P[i] and not Q[i] for i in range(4)]
elif indsol ==1:
    R = [P[i] or not Q[i] for i in range(4)]
elif indsol==2:
    R = [not P[i] and Q[i] for i in range(4)]
elif indsol ==3:
    R = [not P[i] or Q[i] for i in range(4)]

row1 = ["V" if P[i] else "F" for i in range(4)]
row2 = ["V" if Q[i] else "F" for i in range(4)]
row3 = ["V" if R[i] else "F" for i in range(4)]
==

question ==
Soit P et Q deux propositions logiques. On considère une proposition $! T(P,Q) !$, construite à partir des propositions P et Q, dont la table de vérité est donnée ci-dessous. 

<table class="table table-bordered table-fit">
<tr>
<td > $! P !$ </td>
<td > $! Q !$ </td>
<td > $! T(P,Q) !$ </td>
</tr>
{% for i in range(4) %}
<tr>
<td> {{row1[i]}} </td>
<td> {{row2[i]}} </td>
<td> {{row3[i]}} </td>
</tr>
{% endfor %}
</table>

Parmi les propositions suivantes, laquelle est logiquement équivalente à $! T(P,Q) !$ ?
==