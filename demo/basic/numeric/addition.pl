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

inputblock ==
Réponse :  <input type="text" class="form-control" pattern="[A-Za-z]{3}">
==

style.input ==
<style>
.mat-form-field-wrapper{
  margin: 0 !important;
  padding-bottom: 0 !important;
}
</style>
==