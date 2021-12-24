extends = /model/basic/dragdrop.pl

title = Os du crâne

sol ==
Os frontal
Os pariétal
Os sphénoïde
Os temporal
Os occipital
Os ethmoïde
==

scheme =$ skull_bones.png

question ==
<div class="row">
<div class="column">
<img src="{{ scheme }}" style="max-width: 300px; vertical-align:top; display: inline-block">
</div>
<div class="column">
<ul>
{% for drop in drp.comp %}
<li> {{ loop.index }}. {{ drop|component }} </li>
{% endfor %}
</ul>
</div>
</div> 

{% for label in lab.comp %} {{ label|component }} {% endfor %}
==
