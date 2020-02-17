@ /utils/sandboxio.py [sandboxio.py]
grader  =@ /grader/evaluator2.py
builder =@ /builder/before2.py
@ /utils/dragdrop.py [dragdrop.py]

title = 

before==
from dragdrop import Drop, Label, Drops, Labels, DragDropeval
import random as rd

numbers = [rd.sample(range(10,100),2) for _ in range (4)]
lt=r"<"
gt=r">"
sol=[lt,gt,gt,lt]
label=Drops([lt,gt])
drops = Drops(4,css="myclass")
==

text==
{{numbers}}
==

form==
{{ label[0] | component }} {{ label[1] | component }}
<br/>

<ul>
{% for i in range(4) %}
<li> {{ numbers[i][0] }} {{ drops[i]|component }} {{ numbers[i][1] }} </li>
{% endfor %}
</ul>
==

evaluator==
from dragdrop import DragDropeval
grade=DragDropeval(drops,sol)
==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==
