extends = /model/basic.pl
@ /utils/components/dragdrop.py [customdragdrop.py]

title = Comparaison de nombres (DragDrop)

before==#|python|
import random as rd
from customdragdrop import DragDropGroup

lt="$%\lt%$" # latex for "less than"
gt="$%\gt%$" # latex for "greater than"

n = 4

mygroup = DragDropGroup()
mygroup.set_label({"lt": lt, "gt": gt})

numbers = []
for i in range(n):
    [a,b] = rd.sample(range(10,100),2)
    numbers.append([a,b])
    mygroup.add_drop({i:"coucou"}) 
    if a < b:
        mygroup.add_match_by_content(i,lt) 
    else:
        mygroup.add_match_by_content(i,gt) 

aaa=mygroup.labels['lt']
b=mygroup.labels['gt']
c=mygroup.drops[0]
d=mygroup.drops[1]
e=mygroup.drops[2]
f=mygroup.drops[3]        
==

text ==
{{ aa|component }} {{ b|component }}
{% for label in mygroup.labels.values() %} {{ label|component }} {% endfor %}
==

form ==#|html|
<ul>
{% for i, drop in mygroup.drops.items() %}
<li> {{ numbers[i|int][0] }} {{ drop|component }} {{ numbers[i|int][1] }} </li>
{% endfor %}
</ul>
<ul>

</ul>

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






