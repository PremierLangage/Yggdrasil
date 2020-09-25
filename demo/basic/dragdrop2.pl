extends = /model/basic/dragdrop.pl

title ==
Exemple 2
==

dropsolutions ==
Os frontal
Os pariétal
Os sphénoïde
Os temporal
Os occipital
Os ethmoïde
==

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


