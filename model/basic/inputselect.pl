extends = /model/basic/basic.pl

input =: Input

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
elif input.value not in input.autocomplete:
    score = -1
else:
    score = 0
==

