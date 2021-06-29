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
<div class="fcontainer">
<span> </span> {{ input|component }}
</div>
==

inputblock2 ==
<div class="container">
  <div class="row align-items-center">
    <div class="col-md-auto">
Réponse :
    </div>
    <div class="col">
{{ input|component }}
    </div>
  </div>
</div>
==


style.input ==
<style>
.mat-form-field-wrapper{
  margin: 0 !important;
  padding-bottom: 0 !important;
}

.mat-form-field-appearance-outline .mat-form-field-infix {
    padding-top: 0.8em !important;
    padding-bottom: 0.6em !important;
}
</style>
==