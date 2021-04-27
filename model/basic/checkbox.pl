extends = /model/basic.pl

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

shuffled % true

footerbefore ==
if isinstance(items, str):
    _items_ = items.splitlines()
elif isinstance(items, list):
    _items_= items
else:
    raise TypeError("items must be a string or a list")

checkbox.setitems(_items_)

if shuffled:
    checkbox.shuffle()
==

settings.feedback = lightscore

form ==
{{ checkbox|component }}
==

evaluator ==
feedback = " "
score = checkbox.eval()
==
