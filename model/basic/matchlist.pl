extends = /model/basic.pl

title =

nbsample = 0

footerbefore ==
import random as rd
nbsample = int(nbsample)

if isinstance(sortedlist, str): 
    lst = sortedlist.splitlines()
else:
    lst = sortedlist
if nbsample == 0:
    nbsample = len(lst)

matchlist.setdata_from_matches([(row['pays'], row['capitale']) for row in sample_rows])
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
