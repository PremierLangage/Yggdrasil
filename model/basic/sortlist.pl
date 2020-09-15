extends = /model/basic.pl

title =

text==
En utilisnt Drag and Drop, rangez les valeurs dans l'ordre.
==

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

samplelist= [ lst[i] for i in  sorted(rd.sample(range(len(lst)), nbsample))]
sortlist.setdata_from_list(samplelist)
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


