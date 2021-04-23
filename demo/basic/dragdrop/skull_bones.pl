extends = /model/basic/dragdrop.pl

title ==
Exemple 2
==

sol ==
Os frontal
Os pariétal
Os sphénoïde
Os temporal
Os occipital
Os ethmoïde
==

scheme =$ /Biology/media/550px-Cranial_bones_numbers.svg.png

form ==
 <div class="row">
  <div class="column">
    <img src="{{ scheme }}" style="max-width: 300px; display: inline-block">
  </div>
  <div class="column">
    <ul>
        {% for i in range(nbdrops) %}
        <li> {{ i + 1 }}. {{ drops[i]|component }} </li>
        {% endfor %}
    </ul>
  </div>
</div> 

{% for label in labels %}
{{ label|component }}
{% endfor %}
==
