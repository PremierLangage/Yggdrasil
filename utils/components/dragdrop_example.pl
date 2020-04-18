extends = /model/basic.pl

@ /utils/components/dragdrop.py [customdragdrop.py]

title = Comparaison de nombres (DragDrop)

before==
from customdragdrop import CustomDragDrop, DragDropGroup
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

llt = CustomDragDrop.Label(lt)
lgt = CustomDragDrop.Label(gt)
drops = [CustomDragDrop.Drop(i) for i in range(n)]
==

text==
Comparer les nombres suivants avec les symboles {{ llt | component }} et {{ lgt | component }}.
==

form==
<ul>
{% for i in range(4) %}
<li> {{ numbers[i][0] }} {{ drops[i]|component }} {{ numbers[i][1] }} </li>
{% endfor %}
</ul>
==

settings.feedback = lightscore

evaluator==#|python|
#from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

#grade=CustomDragDrop.eval(drop,sol)
#groupp = DragDropGroup(labels = label, drop_zones = drop)

#for i in range(len(numbers)):
#        if numbers[i][0] < numbers[i][1]:
#            groupp.set_match(label[0],drop[i])
#        elif numbers[i][0] > numbers[i][1]:
#            groupp.set_match(label[1],drop[i])

#grade = groupp.eval(grading_function = right_minus_wrong)
grade = (100, 'cool')


==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==








