extends = /model/basic/basic.pl
@ /utils/components/scoring.py
@ /utils/components/matchlist.py [matchlist.py]

matchlist =: MatchList
matchlist.decorator = MatchList

multiple = False
title = 

nbmatches = None

delimiter = ","

scoring = RightMinusWrong

process ==
import random as rd

if isinstance(matches, str): 
    _matches_ = [match.split(delimiter) for match in matches.splitlines()]
else:
    _matches_ = matches

if isinstance(nbmatches, int):
    _nbmatches_ = nbmatches
else:
    _nbmatches_ = len(_matches_)

matchlist.setdata_from_matches(rd.sample(_matches_, _nbmatches_))
matchlist.scoring = scoring

if multiple:
    matchlist.multiple = True
==

inputblock ==
{{ matchlist|component }}
==

evaluator ==
score = matchlist.eval()
==