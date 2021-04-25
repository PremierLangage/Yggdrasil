extends = /model/basic.pl

title =

nbmatches % null

footerbefore ==
import random as rd

if isinstance(matches, str): 
    _matches_ = [match.split(",") for match in matches.splitlines()]
else:
    _matches_ = matches

if isinstance(nbmatches, int):
    _nbmatches_ = nbmatches
else:
    _nbmatches_ = len(_matches_)

matchlist.setdata_from_matches(rd.sample(_matches_, _nbmatches_))
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
