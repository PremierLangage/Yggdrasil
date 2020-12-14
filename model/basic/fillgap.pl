extends = /model/basic/dragdrop.pl

title =

footerbefore ==
from customdragdrop import CustomDragDrop
drops = []
labels = []

import re
from itertools import count

number_count = 1;
counter = count(number_count)

dropsolutions = re.findall(r'\{(.*?)\}', s)
form = re.sub(r'\{(.*?)\}', lambda x: "{{ drops[" + str(next(counter)) + "]|component }}", s)

nbdrops = len(dropsolutions)
for _ in dropsolutions:
    drops.append(CustomDragDrop.Drop())

==


text ==

==

filledtext ==
Voici des {fruits}, des {fleurs}
==

form ==
<img src="{{scheme}}" style="max-width: 300px; vertical-align:top; display: inline-block"> 
<ul>
{% for i in range(nbdrops) %}
<li> {{ i + 1 }}. {{ drops[i]|component }} </li>
{% endfor %}
</ul>

{% for label in labels %}
{{ label|component }}
{% endfor %}
==

evaluator ==
n = len(drops)
num_right = 0
num_wrong = 0

for i in range(n):
    if drops[i].content == lstsolutions[i]:
        num_right += 1
        drops[i].css += "success-state"
    else:
        num_wrong +=1
        drops[i].css += "error-state"

if num_wrong > 0 :
    score = 0
else:
    score = 100
==



