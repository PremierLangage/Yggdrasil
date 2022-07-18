
author=DD and DR
extends= /model/math.pl
extends= /AAAA/dominique/simplematchlist.pl

before==

var('t')

f=[sin(t),cos(t),t**2,t**3, log(t)/log(2), exp(t),127]
gf=[ f"$!{latex(fi)}!$" for fi in f]
df=[  f"$!{latex(diff(U,x))}!$" for U in f]

pairs= [ TT for TT in zip(gf,df)]

# Dans une version future les lignes suivantes ne seront plus nécessaires 
if type(pairs)==list:
    matchlist.setdata_from_matches(pairs)
else:
    if "delimiter" not in globals():
      delimiter='§'
    # ne prend que les lignes avec un délimiter et construit une paire avec la chaine.
    matchlist.setdata_from_matches([ l.split(delimiter) for l in  pairs.splitlines() if delimiter in l ])

==

text==
Associez chaque fonction à sa dérivée.
==
