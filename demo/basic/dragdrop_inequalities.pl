extends = /model/basic.pl

@ /utils/components/dragdrop.py [dragdrop.py]

title = Comparaison de nombres

before==
from dragdrop import CustomDragdrop
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
drop = Drops(n)
==

text==
Comparer les nombres suivants avec les symboles {{ label[0] | component }} et {{ label[1] | component }}.
==

form==
<ul>
{% for i in range(4) %}
<li> {{ numbers[i][0] }} {{ drop[i]|component }} {{ numbers[i][1] }} </li>
{% endfor %}
</ul>
==

evaluator==
from dragdrop import DragDropeval
grade=DragDropeval(drop,sol)
==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==

