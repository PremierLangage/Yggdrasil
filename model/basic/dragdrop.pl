extends = /model/basic.pl

title =

footerbefore ==
from customdragdrop import CustomDragDrop
drops = []
labels = []

if isinstance(dropsolutions, str):
    list_dropsolutions = dropsolutions.splitlines()
else:
    list_dropsolutions = dropsolutions

if 'labelcontents' in globals():
    list_labelcontents = labelcontents.splitlines()
else:
    list_labelcontents = list(set(dropsolutions))

for content in list_labelcontents:
    labels.append(CustomDragDrop.Label(content=content))

nbdrops = len(list_dropsolutions)
for _ in list_dropsolutions:
    drops.append(CustomDragDrop.Drop())
==

dropsolutions ==
Os frontal
Os pariétal
Os sphénoïde
Os temporal
Os occipital
Os ethmoïde
==

text =

scheme =$ /Biology/media/550px-Cranial_bones_numbers.svg.png

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
for i in range(drops):
    if drops[i].content == dropsolutions[i]:
            drop.css += "success-state"
        else:
            drop.css += "error-state"    
==


