extends = /model/basic.pl

title =

nbsample = 0

footerbefore ==
import random as rd


if isinstance(sortedlist, str): 
    lst = sortedlist.splitlines()
else:
    lst = sortedlist
if nbsample == 0:
    nbsample = len(lst)
    
sortlist.setdata_from_list(rd.sample(lst, nbsample))
==

text ==
Classer ces premiers ministres de la Ve République du plus ancien au plus récent (selon la date d'entrée en fonction).
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
