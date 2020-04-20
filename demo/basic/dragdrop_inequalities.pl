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
data = [(1,"Os frontal"),(2, "Os pariétal"), (3, "Os sphénoïde"), (4, "Os temporal"), (5, "Os occipital"), (6, "Os éthmoïde")]
order = []
for n,v in data:
    order.append(n)
    mygroup.add_drop({str(n):v}) 
    mygroup.add_match_by_content(str(n),v) 
==

text ==
 <img src="{{scheme}}" style="max-width: 400px"> 
==

form ==
<ul>
{% for i in range(n) %}
<li> {{ order[i] }}. {{ mygroup.drops[i|string]|component }} </li>
{% endfor %}
</ul>
{% for label in mygroup.labels.values() %} {{ label|component }} {% endfor %}
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


