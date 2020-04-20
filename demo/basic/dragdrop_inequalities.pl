extends = /model/basic.pl

scheme =$ /demo/basic/550px-Cranial_bones_numbers.svg.png

title = Comparaison de nombres (DragDrop)

before==#|python|
import random as rd
from customdragdrop import DragDropGroup

lt="$%\lt%$" # latex for "less than"
gt="$%\gt%$" # latex for "greater than"

n = 4

mygroup = DragDropGroup()
mygroup.set_label({"lt": lt, "gt": gt})

order = []
for i in range(n):
    order.append(i+1)
    mygroup.add_drop({str(i):"coucou"}) 
    mygroup.add_match_by_content(str(i),lt) 
==

text ==
 <img src="{{scheme}}" style="max-width: 400px;"> 

{% for label in mygroup.labels.values() %} {{ label|component }} {% endfor %}
==

form ==
<ul>
{% for i in range(n) %}
<li> {{ order[i] }}. {{ mygroup.drops[i|string]|component }} </li>
{% endfor %}
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


