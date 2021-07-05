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

if isinstance(targets, str): 
    _targets_ = targets.splitlines()
else:
    _targets_ = targets

if isinstance(nbmatches, int):
    _nbmatches_ = nbmatches
else:
    _nbmatches_ = len(_matches_)

matchlist.setdata_from_matches(rd.sample(_matches_, _nbmatches_))
matchlist.add_targets(_targets_)

matchlist.scoring = scoring

if multiple:
    matchlist.set_multiple()
==

inputblock ==
{{ matchlist|component }}
==

evaluator ==
score = matchlist.eval()
==