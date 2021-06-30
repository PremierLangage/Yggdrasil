extends = /model/basic/numeric.pl

before ==
from random import randint
a = randint(10, 50)
b = randint(10, 50)
sol = a + b
==

question ==
Calculer {{ a }} + {{ b }}.
==


inputblock ==
<div class="container">
  <div class="row align-items-center">
    <div class="col" style="padding:0;">
Réponse : 
    </div>
    <div class="col" style="padding-left:0.5em; padding-right:0;">
{{ input|component }}
    </div>
  </div>
</div>
==
