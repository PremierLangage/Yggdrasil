extends = /model/basic.pl

title =

footerbefore ==
from customdragdrop import CustomDragDrop
drops = []
labels = []

if 'labelscontent' in globals():
    list_labelcontents = labelscontent.splitlines()
else:
    list_labelcontents = list(set(dropsol.splitlines()))

for content in list_labelcontents:
    labels.append(CustomDragDrop.Label(content=content))

for _ in dropsol.splitlines():
    drops.append(CustomDragDrop.Drop())
==

dropsol ==
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

