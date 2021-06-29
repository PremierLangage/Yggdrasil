extends = /model/basic/numeric.pl

before ==
from random import randint
a = randint(10, 50)
b = randint(10, 50)
sol = a + b
==

question ==
Calculer {{ a }} + {{ b }}. {{v}}
==



style.input ==
<style>
.mat-form-field-wrapper{
  margin: 0 !important;
  padding-bottom: 0 !important;
  max-width: 20em !important;
}

.mat-form-field-appearance-outline .mat-form-field-infix {
    padding-top: 0.8em !important;
    padding-bottom: 0.6em !important;
}
</style>
==