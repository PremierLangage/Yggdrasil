extends = /model/basic/basic.pl


# Main keys

nbitems = None

scoring = "ExactOrder"

# Input block

inputblock == #|html|
{{ input|component }}
==

# Before scripts

before_scripts = ["importfunc", "initinput", "before", "process"]

importfunc == #|py|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

initinput == #|py|
from sortlist import SortList
input = SortList()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
from random import randint, sample

_nbitems_ = nbitems

if isinstance(sortedlist, str):
    _sortedlist_ = sortedlist.splitlines()
elif isinstance(sortedlist, list):
    _sortedlist_= sortedlist

if not isinstance(_nbitems_, int):
    _nbitems_ = len(_sortedlist_)

input.set_data_from_list([_sortedlist_[i] for i in sorted(sample(range(len(_sortedlist_)), _nbitems_))])
input.scoring = scoring
==

# Evaluation scripts

evaluator == #|py|
score = input.eval()
input.display_feedback()
input.disable()
==



apidoc == #|json|
{
    "name": "sortlist",
    "keys": {
        "sortedlist": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des items. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "nbitems": {
            "type": "(int, None)",
            "default": "None",
            "description": "Nombre d'items à ordonner parmi la liste d'items. Si ce nombre n'est pas précisé, tous les items de la liste sont pris."
        },
        "scoring": {
            "type": "('KendalTau', 'ExactOrder')",
            "default": "'KendalTau'",
            "description": "Barème de l'exercice."
        }
    }
}
==