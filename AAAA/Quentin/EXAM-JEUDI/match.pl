
extends= /model/math.pl
extends= simplematchlist.pl
title=Cosinus et bijection
before==

gf=[ f"$![-\pi/2,\pi/2]!$", f"$![0,\pi/2]!$" ,f"$![-\pi/6,\pi/6]!$",f"$![-\pi,-\pi/2]!$" ]
df=[  f"$![-1,1]!$",f"$![0,1]!$",f"$![-1/2 , 1/2] !$",f"$![-1,0]!$"]

pairs= [ TT for TT in zip(gf,df)]

if type(pairs)==list:
    matchlist.setdata_from_matches(pairs)
else:
    matchlist.setdata_from_matches([ l.split("§") for l in  pairs.splitlines() if "§" in l ])

==

text==
Associez à chaque ensemble de départ $!E!$ un ensemble d'arrivée $!F!$ de façon à ce que $!\sin:E\to F!$ soit bijective.
==







