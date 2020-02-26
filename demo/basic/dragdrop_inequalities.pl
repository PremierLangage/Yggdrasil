extends = /model/basic.pl

@ /utils/components/dragdrop.py [customdragdrop.py]

title = Comparaison de nombres (DragDrop)

before==
from customdragdrop import CustomDragDrop
import random as rd

lt="&lt; aaaaaaaaaaaaaaaaaaaaaa"
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

label = CustomDragDrop.Labels([lt,gt])
drop = CustomDragDrop.Drops(n)
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
from customdragdrop import CustomDragDrop

grade=CustomDragDrop.eval(drop,sol)
==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==


