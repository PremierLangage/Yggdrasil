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
input.disabled = True
==

evalprocess ==
if scpre = 100:
    input.suffix = r'<i class="fas fa-check" style="color: #006400"></i>'
elif score = 0:
    input.suffix = r'<i class="fas fa-times" style="color: #8B0000"></i>'
input.disabled = True
==

solution ==
La solution est {{ sol }}.
==