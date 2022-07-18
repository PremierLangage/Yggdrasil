

extends = /model/basic.pl


pairs==
un§one
deux§two
trois§three
==

before ==
if type(pairs)==list:
    matchlist.setdata_from_matches(pairs)
else:
    if "delimiter" not in globals():
        delimiter="§"
    matchlist.setdata_from_matches([ l.split(delimiter) for l in  pairs.splitlines() if delimiter in l ])
==

text= A DEFINIR 
title= CECI EST UN PATRON NE PAS UTILISER DIRECTEMENT

matchlist =: MatchList

@ /utils/components/matchlist.py [custommatchlist.py]
matchlist.decorator = CustomMatchList

form ==
{{ matchlist|component }}
==

evaluator ==
score = matchlist.eval()
==

settings.feedback = lightscore








