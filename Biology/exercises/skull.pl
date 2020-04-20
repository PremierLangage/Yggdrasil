extends = /model/basic.pl

scheme =$ /Biology/media/550px-Cranial_bones_numbers.svg.png

title = Os de la voûte cranienne

before==#|python|
import random as rd
from customdragdrop import DragDropGroup

lt="$%\lt%$" # latex for "less than"
gt="$%\gt%$" # latex for "greater than"

n = 4

mygroup = DragDropGroup()
labelscontent = ["Os frontal", "Os pariétal", "Os sphénoïde", "Os temporal", "Os occipital", "Os éthmoïde"]
mygroup.set_label(labelscontent) 
order = []
for i, v in enumerate(labelscontent):
    order.append(i+1)
    mygroup.add_drop({str(i):""}) 
    mygroup.add_match_by_content(str(i),v) 
==

text ==

==

form ==
<img src="{{scheme}}" style="max-width: 50%; vertical-align:top; display: inline-block"> 
<div style="max-width: 50%;display: inline-block"> 
<ul>
{% for i in order %}
<li> {{ i }}. {{ mygroup.drops[(i-1)|string]|component }} </li>
{% endfor %}
</ul>
</div>

<div style="display: block"> 
{% for label in mygroup.labels.values() %} {{ label|component }} {% endfor %}
</div>
==

settings.feedback = lightscore

evaluator==#|python|
from customdragdrop import right_minus_wrong

grade = mygroup.eval(grading_function = right_minus_wrong)
==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==


