extends = /model/basic/inputgroup.pl

question ==
Quelles sont les capitales des pays suivants ?
==

before == #|py|
inputs = [TextInput(), TextInput()]
inputs[0].sol = "Paris"
inputs[1].sol = "Rome"
==

inputblock == #|html|
<div style="display:flex; align-items: center; margin-bottom: 1em;">
  <div> France : </div>
  <div style="margin-left: 1em;"> {{ inputs[0]|component }}</div>
</div>
<div style="display:flex; align-items: center; margin-bottom: 1em;">
  <div> Italie : </div>
  <div style="margin-left: 1em;"> {{ inputs[1]|component }} </div>
</div>
==

solution ==
France : Paris ; Italie : Rome.
==

test.group ==
{{ test|toto }}
==