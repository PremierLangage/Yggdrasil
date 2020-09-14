extends = /model/basic.pl

title =

nbsample = 0

footerbefore ==
import random as rd
nbsample = int(nbsample)

if isinstance(pairings, str): 
    lst = [paring.split(";") for pairing pairings.splitlines()]
else:
    lst = pairings
if nbsample == 0:
    nbsample = len(lst)

matchlist.setdata_from_matches(rd.sample(lst, nbsample))
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
