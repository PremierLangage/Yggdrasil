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

sortlist.setdata_from_list(rd.sample(lst, nbsample))
==

sortlist =: SortList

@ /utils/components/sortlist.py [customsortlist.py]
sortlist.decorator = CustomSortList

form ==
{{ sortlist|component }}
==

evaluator ==
score = sortlist.eval()
==

settings.feedback = lightscore
