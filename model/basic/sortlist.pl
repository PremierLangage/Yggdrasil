extends = /model/basic/basic.pl
@ /utils/components/scoring.py

doc == #|python|
{
    "name": "sortlist",
    "keys": {
        "sortedlist": {
            "type": "(str, list[str])",
            "default": "",
            "description": "Liste des items."
        },
        "nbitems": {
            "type": "(int, None)",
            "default": None,
            "description": "Nombre d'items à ordonner."
        },
        "scoring": {
            "type": "('KendalTau', 'ExactOrder')",
            "default": 'KendalTau',
            "description": "Nombre d'items à ordonner."
        }
    }
}
==

title =

nbitems % null

footerbefore ==
from random import randint, sample

from ast import literal_eval

_nbitems_ = literal_eval(str(nbitems))

if isinstance(sortedlist, str):
    _sortedlist_ = sortedlist.splitlines()
elif isinstance(sortedlist, list):
    _sortedlist_= sortedlist
else:
    raise TypeError("sortedlist must be a string or a list")

if not isinstance(_nbitems_, int):
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