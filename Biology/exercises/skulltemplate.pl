
extends = /model/basic.pl



#! linter:required:labelscontent
#! linter:required:title

# 
#! linter:barem:

#! linter:scheme:




before==#|python|
import random as rd
from customdragdrop import DragDropGroup

mygroup = DragDropGroup(css="myclass")
labelscontent = ["un", "deux", "trois", "quatre", "cinq", "six"]

# mygroup.set_label(labelscontent) 
order = list(range(len(labelscontent)))
rd.shuffle(order)

for i, j in enumerate(order):
    mygroup.add_label({i:labelscontent[j]})
    mygroup.add_drop({i+1:"XXX"}) 
for i, j in enumerate(order): # can only be done after everycomponent has been constructed
    mygroup.add_match_by_name(i+1, j) 


evaluator = f"""
from customdragdrop import {barem}

grade = mygroup.eval(grading_function = {barem})
"""

==

text ==

==

form ==
<img src="{{scheme}}" style="max-width: 300px; vertical-align:top; display: inline-block"> 
<div style="max-width: 100%;display: inline-block"> 
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


extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 10em;
        }
</style>
==



