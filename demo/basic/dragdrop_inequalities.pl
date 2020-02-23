extends = /model/basic.pl

@ /utils/components/dragdrop.py [dragdrop.py]

title = Comparaison de nombres

before==
from dragdrop import CustomDragDrop
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

label = CustomDragDrop.Labels([lt,gt])
drop = CustomDragDrop.Drops(n)
==

text==
Comparer les nombres suivants avec les symboles {{ label[0] | component }} et {{ label[1] | component }}.
==

form==
{% for i in range(4) %}
- {{ numbers[i][0] }} {{ drop[i]|component }} {{ numbers[i][1] }}
{% endfor %}
==

evaluator==
from dragdrop import CustomDragDrop

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

