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
::ng-deep .mat-form-field-wrapper{
  margin: 0 !important;
  padding: 0;
}
</style>


==