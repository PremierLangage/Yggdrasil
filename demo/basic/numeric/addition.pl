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
  <div class="row">
    <div class="col-md-auto">
Calculer {{ a }} + {{ b }}.
    </div>
    <div class="col col-lg-2">
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