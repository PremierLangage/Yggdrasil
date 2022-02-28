extends = /model/basic/basic.pl


title =

nbitems = None

process ==
from random import randint, sample

_nbitems_ = nbitems

if isinstance(sortedlist, str):
    _sortedlist_ = sortedlist.splitlines()
elif isinstance(sortedlist, list):
    _sortedlist_= sortedlist

if not isinstance(_nbitems_, int):
    _nbitems_ = len(_sortedlist_)

sortlist.set_data_from_list([_sortedlist_[i] for i in sorted(sample(range(len(_sortedlist_)), _nbitems_))])
==

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