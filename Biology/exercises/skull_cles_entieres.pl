
extends = /model/basic.pl

scheme =$ /Biology/media/550px-Cranial_bones_numbers.svg.png

title = Os de la voûte cranienne

before==#|python|
import random as rd
from customdragdrop import DragDropGroup

mygroup = DragDropGroup()
labelscontent = {1:"Os frontal", 2:"Os pariétal", 3:"Os sphénoïde", 4:"Os temporal", 5:"Os occipital", 6:"Os ethmoïde"}
mygroup.set_label(labelscontent) 

for i in labelscontent:
    mygroup.add_drop({i:""}) 
    mygroup.add_match_by_name(i,i) 
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
{% for i in range(6) %}
    {{ mygroup.labels[i|int]|component }} 
{% endfor %}
</div>
==

settings.feedback = lightscore

evaluator==#|python|
from customdragdrop import right_minus_wrong

grade = mygroup.eval(grading_function = right_minus_wrong)
==

