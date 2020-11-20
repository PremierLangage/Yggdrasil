
extends = /model/basic.pl


pairs==
un§one
deux§two
trois§three
==

before ==
matchlist.setdata_from_matches([ l.split("§") for l in  pairs.splitline() if "§" in l ])
==



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





