extends = /model/basic/inputgroup.pl

before ==
inputs = [TextInput(), TextInput()]
inputs[0].sol = "Paris"
inputs[1].sol = "Rome"
==

inputblock ==
<div class="container">
  <div class="row justify-content-md-center">
    <div class="col-md-auto">
      France
    </div>
    <div class="col col-lg-2">
      {{ inputs[0]|component }}
    </div>
  </div>
  <div class="row">
    <div class="col-md-auto">
      Italie
    </div>
    <div class="col col-lg-2">
      {{ inputs[1]|component }}
    </div>
  </div>
</div>
==

question ==
Quelle est la capitale des pays suivants ?
==
