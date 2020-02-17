@ /utils/sandboxio.py [sandboxio.py]
grader  =@ /grader/evaluator2.py
builder =@ /builder/before2.py
@ /utils/dragdrop.py [dragdrop.py]

title = 

before==
from dragdrop import Drop, Label, Drops, Labels, DragDropeval

numbers = [rd.sample(range(10,100),2)) for in range (4)]
lt="\<"
gt="\>"
sol=[lt,gt,gt,lt]
label=Drops([lt,"hhhhhhhhhhhhhhh"])
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
<li> {{ chiffres[i][0] }} {{ drops[i]|component }} {{ chiffres[i][1] }} </li>
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
