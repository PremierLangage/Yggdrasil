extends = /model/basic/basic.pl
@ /utils/components/scoring.py

title =

nbitems % null

footerbefore ==
from random import randint, sample

if isinstance(sortedlist, str):
    _sortedlist_ = sortedlist.splitlines()
elif isinstance(sortedlist, list):
    _sortedlist_= sortedlist
else:
    raise TypeError("sortedlist must be a string or a list")

if isinstance(nbitems, int):
    _nbitems_ = nbitems
else:
    _nbitems_ = len(_sortedlist_)

sortlist.setdata_from_list([_sortedlist_[i] for i in sorted(sample(range(len(_sortedlist_)), _nbitems_))])
==

sortlist =: SortList

@ /utils/components/sortlist.py [customsortlist.py]
sortlist.decorator = CustomSortList

inputblock ==
{{ sortlist|component }}
==

evaluator ==
score = sortlist.eval()
==

settings.feedback = lightscore


