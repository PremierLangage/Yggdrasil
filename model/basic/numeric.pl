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
    <div class="col-xs-6" style="padding-left:0.5em; padding-right:0;">
{{ input|component }}
    </div>
  </div>
</div>
==

evaluator ==
if input.value == sol:
    score = 100
else:
    score = 0
==

solution ==
La solution est {{ sol }}.
==