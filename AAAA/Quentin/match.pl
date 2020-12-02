
extends= /model/math.pl
extends= simplematchlist.pl

before==

gf=[ f"$![0,\pi]!$", f"$![0,\frac{\pi}{2}]!$",f"$![\frac{\pi}{3},\frac{2\pi}{3}]!$",f"$!\\{\pi\\}!$",f"$!\\{ 0 \\}!$" ]
df=[  f"$![-1,1]!$",f"$![0,1]!$",f"$![-\frac12 , \frac12] !$", f"$! \\{-1\\}!$",f"$!\\{-1\\}!$"]

pairs= [ TT for TT in zip(gf,df)]

if type(pairs)==list:
    matchlist.setdata_from_matches(pairs)
else:
    matchlist.setdata_from_matches([ l.split("§") for l in  pairs.splitlines() if "§" in l ])

==

text==
Associez à chaque ensemble de départ $!E!$ un ensemble d'arrivé $!F!$ de façon à ce que $!cos:E\to F!$ soit bijective.
==




