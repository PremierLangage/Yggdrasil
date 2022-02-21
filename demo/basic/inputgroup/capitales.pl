extends = /model/basic/inputgroup.pl

before ==
inputs = [TextInput(), TextInput()]
inputs[0].sol = "Paris"
inputs[1].sol = "Rome"
==

inputblock ==
<div class="container">
  <div class="row py-1">
    <div class="col-md-auto align-self-center">
        France
    </div>
    <div class="col">
      {{ inputs[0]|component }}
    </div>
  </div>
  <div class="row py-1">
    <div class="col-md-auto">
      Italie
    </div>
    <div class="col">
      {{ inputs[1]|component }}
    </div>
  </div>
</div>
==

question ==
Quelle est la capitale des pays suivants ?
==
