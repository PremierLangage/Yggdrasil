
extends = /model/basic.pl

scheme =$ /Biology/media/550px-Cranial_bones_numbers.svg.png

title = Os de la voûte cranienne

before==#|python|
from customdragdrop import DragDropGroup
from random import shuffle

mygroup = DragDropGroup()
labelscontent = ["Os frontal", "Os pariétal", "Os sphénoïde", "Os temporal", "Os occipital", "Os ethmoïde"]

for i in range(1,6):
    mygroup.add_label({i:labelscontent[i-1]})
    mygroup.add_drop({i:""}) 
    mygroup.add_match_by_name(i, i) 

mygroup.shuffle_labels()

a = {1:1,2:2,3:3,4:4}
b = list(a.items())
shuffle(b)
a = dict(b)

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
{% for key,value in mygroup.labels.items() %}
    {{ value|component }} 
{% endfor %}
</div>

{% for key, value in a.items() %}}
{{value}}
{% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|
from customdragdrop import right_minus_wrong

grade = mygroup.eval(grading_function = right_minus_wrong)
==




