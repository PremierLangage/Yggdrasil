

extends = /model/basic/basic.pl



before ==
matchlist.setdata_from_matches([ l.split("§") for l in  pairs.splitlines() if "§" in l ])
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


