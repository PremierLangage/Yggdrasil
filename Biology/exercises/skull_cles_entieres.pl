
extends = /model/basic.pl

scheme =$ /Biology/media/550px-Cranial_bones_numbers.svg.png

title = Os de la voûte cranienne

before==#|python|
import random as rd
from customdragdrop import DragDropGroup

mygroup = DragDropGroup()
labelscontent = ["Os frontal", "Os pariétal", "Os sphénoïde", "Os temporal", "Os occipital", "Os ethmoïde"]

order = list(range(6))
rd.shuffle(order)

for i, j in enumerate(order):
    mygroup.add_label({i:labelscontent[j]})
    mygroup.add_drop({i+1:""}) 
    mygroup.add_match_by_name(i+1, j) 
==

text ==

==

form ==
<img src="{{scheme}}" style="max-width: 300px; vertical-align:top; display: inline-block"> 
<div style="max-width: 100%;display: inline-block"> 
<ul>
{% for i, drop in mygroup.drops.items() %}
<li> {{ i }}. {{ drop|component }} </li>
{% endfor %}
</ul>
</div>
<div style="display: block"> 
{% for i, label in mygroup.labels.items() %}
    {{ label|component }} 
{% endfor %}
</div>
==

settings.feedback = lightscore

evaluator==#|python|
from customdragdrop import right_minus_wrong

grade = mygroup.eval(grading_function = right_minus_wrong)
==


