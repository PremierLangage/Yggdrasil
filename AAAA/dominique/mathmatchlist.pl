
extends= /model/math.pl
extends= simplematchlist.pl

before==

var('x')

f=[sin(x),cos(x),x**2,x**3, log(x)/log(2), exp(x)]
gf=[ f"$!{latex(fi)}!$" for fi in f]
df=[  f"$!{latex(diff(U,x))}!$" for U in f]

pairs= [ TT for TT in zip(gf,df)]

if type(pairs)==list:
    matchlist.setdata_from_matches(pairs)
else:
    matchlist.setdata_from_matches([ l.split("§") for l in  pairs.splitlines() if "§" in l ])

==

text==

==
