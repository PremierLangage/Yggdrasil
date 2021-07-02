extends = /model/basic/basic.pl

input =: Input
input.type = number

prefix ==
Réponse :
==

inputblock ==
<div class="container">
  <div class="row align-items-center">
    <div class="col-auto" style="padding:0;">
{{ prefix }} 
    </div>
    <div class="col-xs" style="padding-left:0.5em; padding-right:0;">
{{ input|component }}
    </div>
  </div>
</div>
==

getans ==
ans = input.value
==

evaluator ==
if ans == sol:
    score = 100
else:
    score = 0
==

evalprocess ==
input.disabled = True
==

solution ==
La solution est {{ sol }}.
==