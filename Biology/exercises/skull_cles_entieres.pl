
extends = /model/basic.pl

scheme =$ /Biology/media/550px-Cranial_bones_numbers.svg.png

title = Os de la voûte cranienne

before==#|python|
import random as rd
from customdragdrop import DragDropGroup

mygroup = DragDropGroup()
labelscontent = {0:"Os frontal", 1:"Os pariétal", 2:"Os sphénoïde", 3:"Os temporal", 4:"Os occipital", 5:"Os ethmoïde"}
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
{% for i in range(6) %}
<li> {{ i+1 }}. {{ mygroup.drops[i|int]|component }} </li>
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

