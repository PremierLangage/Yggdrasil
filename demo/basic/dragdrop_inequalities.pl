extends = /model/basic/dragdrop.pl

title ==
Comparaison de nombres (DragDrop)
==

before ==
import random as rd
lt = "&lt;"
gt = "&gt;"

numbers = []
dropsol = []
nbdrops = 4
for _ in range(nbdrops):
    [a,b] = rd.sample(range(10,100),2)
    numbers.append([a,b])
    if a < b:
        dropsol.append(lt)
    else:
        dropsol.append(gt)
==

text==
Comparer les nombres suivants avec les symboles {{ labels[0] | component }} et {{ labels[1] | component }}.
==

form==
<ul>
{% for i in range(nbdrops) %}
<li> {{ numbers[i][0] }} {{ drops[i]|component }} {{ numbers[i][1] }} </li>
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



