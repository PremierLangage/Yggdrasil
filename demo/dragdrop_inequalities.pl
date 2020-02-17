@ /utils/sandboxio.py [sandboxio.py]
grader  =@ /grader/evaluator2.py
builder =@ /builder/before2.py
@ /utils/dragdrop.py [dragdrop.py]

title = 

before==
from dragdrop import Drop, Label, Drops, Labels, DragDropeval
import random as rd

lt="&lt;"
gt="&gt;"

n = 4

numbers = []
sol = []
for _ in range(n):
    [a,b] = rd.sample(range(10,100),2)
    numbers.append([a,b])
    if a < b:
        sol.append(lt)
    else:
        sol.append(gt)

label = Labels([lt,gt])
drops = Drops(n)
==

text==
Comparer les nombres suivants avec les symboles {{ label[0] | component }} et {{ label[1] | component }}.
==

form==
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
