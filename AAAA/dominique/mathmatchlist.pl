


extends = /model/basic/matchlist.pl

before==

pairs= [("2*2",4),("3+3",6),("3**2","9")]

if type(pairs)==list:
    matchlist.setdata_from_matches(pairs)
else:
    matchlist.setdata_from_matches([ l.split("§") for l in  pairs.splitlines() if "§" in l ])

==

text==
Associez chaque fonction à sa dérivée.
==

