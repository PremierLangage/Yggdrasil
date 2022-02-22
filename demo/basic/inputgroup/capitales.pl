extends = /model/basic/inputgroup.pl

question ==
Quelles sont les capitales des pays suivants ?
==

before ==
inputs = [TextInput(), TextInput()]
inputs[0].sol = "Paris"
inputs[1].sol = "Rome"
==

inputblock2 ==
<div class="container">
  <div class="row py-2 align-items-center">
    <div class="col-md-auto">
        France :
    </div>
    <div class="col">
      {{ inputs[0]|component }}
    </div>
  </div>
  <div class="row py-2 align-items-center">
    <div class="col-md-auto">
      Italie :
    </div>
    <div class="col">
      {{ inputs[1]|component }}
    </div>
  </div>
</div>
==

inputblock ==
<div style="display:flex; align-items: center; margin-bottom: 1em;">
  <div>France : </div>
  <div style="margin-left: 1em">{{ inputs[0]|component }}</div>
</div>
<div style="display:flex; align-items: center; margin-bottom: 1em;">
  <div>Italie : </div>
  <div style="margin-left: 1em">{{ inputs[0]|component }}</div>
</div>
</div>
==