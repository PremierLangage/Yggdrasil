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

prefix ==
Réponse :
==

inputblock ==
<div class="container">
  <div class="row align-items-center">
    <div class="col-auto" style="padding:0;">
{{ prefix }} 
    </div>
    <div class="col col-sm-6 col-md-4" style="padding-left:0.5em; padding-right:0;">
{{ input|component }}
    </div>
  </div>
</div>
==

evaluator ==
if input.value == sol:
    score = 100
elif input.value not in input.autocomplete:
    score = -1
else:
    score = 0
==

