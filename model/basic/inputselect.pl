extends = /model/basic/basic.pl

input =: Input

settings.feedback = rightwrong

before_scripts % ["importfunc", "before", "process"]

process ==
from random import randint

if isinstance(items, str):
    _before_scripts % ["importfunc", "before", "process"]

importfunc ==
from random import randint, choice, choices, sample, shuffle
==

process ==
if isinstance(items, str):
    _items_ = items.splitlines()
elif isinstance(items, list):
    _items_= items
else:
    raise TypeError("items must be a string or a list")

input.autocomplete = _items_
==

inputblock ==
{{ input|component }}
==

evaluator ==
if input.value == sol:
    score = 100
else:
    score = 0
==

