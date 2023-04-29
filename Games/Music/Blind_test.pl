#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 30
countdown.hidden % false

autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==

url_sample =$ Samples/back_in_black.ogg

logOnConsole==#|js|
// you may open the browser console to see the message
console.log('hello world');
==

before== #|python|
countdown.actions = [
    { "time": 5, "action": logOnConsole },
    { "time": 0, "action": autoSubmit }
]
counter = 0
==

title = Count Down Component
text==#|html|
<center>
<div>
<img src="{{ url_phot }}" style="width:30%" alt="les instruments de musiques de l'enfer"/><br>
<audio controls>
  <source src="{{ url_clip }}" type="audio/ogg">
  Votre navigateur ne supporte pas la lecture du clip audio.
</audio>
</div>
</center>
==



form ==
 {{ countdown|component }}
==

evaluator== #|python|
remaining = countdown.time
# reset timer
for e in countdown.actions:
    e['consumed'] = False

countdown.time = 10
counter += 1
grade = (100, f'<h3>remaining: {remaining}, counter: {counter}</h3>')

==