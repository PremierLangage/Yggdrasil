extends = /model/basic/dropgroup.pl

sol ==
Os frontal
Os pariétal
Os sphénoïde
Os temporal
Os occipital
Os ethmoïde
==

scheme =$ skull_bones.png

inputblock ==
<div class="row">
<div class="column">
<img src="{{ scheme }}" style="max-width: 300px; vertical-align:top; display: inline-block">
</div>
<div class="column">
<ul>
{% for drop in inputfield.drops %}
<li> {{ loop.index }}. {{ drop|html }} </li>
{% endfor %}
</ul>
</div>
</div> 

{% for label in inputfield.labels %} {{ label|html }} {% endfor %}
==
