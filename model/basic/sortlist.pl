extends = /model/basic.pl

title =

text==
En utilisnt Drag and Drop, rangez les valeurs dans l'ordre.
==

nbitems % Null

footerbeforeold ==
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


footerbefore ==
from random import randint, sample

if isinstance(sortedlist, str):
    _sortedlist_ = sortedlist.splitlines()
elif isinstance(sortedlist, list):
    _sortedlist_= sortedlist
else:
    raise TypeError("sortedlist must be a string or a list")

if nbitems > 0:
    _nbitems_ = nbitems
else:
    _nbitems_ = len(_sortedlist_)

sortlist.setdata_from_list([_sorted_list_[i] for i in sorted(rd.sample(range(len(_sortedlist_)), nbitems))])
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


