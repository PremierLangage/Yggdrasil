extends = /model/basic.pl

@ /utils/components/dragdrop.py [customdragdrop.py]

title = Comparaison de nombres (DragDrop)

before==
import random as rd
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

lt="&lt;"
gt="&gt;"

n = 4

mygroup = DragDropGroup()
mygroup.set_label({"lt": lt, "gt": gt})

numbers = []
for i in range(n):
    [a,b] = rd.sample(range(10,100),2)
    numbers.append([a,b])
    mygroup.add_drop({str(i):"coucou"}) # à modifier  en remplaçant str(i) par i quand les labels/drops pourront être des listes et non des dict.
    if a < b:
        mygroup.add_match_by_content(str(i),lt) 
    else:
        mygroup.add_match_by_content(str(i),gt) 
mygroup.drops['0'].content = 'coucou'
==

text==
Comparer les nombres suivants avec les symboles {{ mygroup.labels['lt'] | component }} et {{ mygroup.labels['gt'] | component }}.
==

form==
<ul>
{% for i in mygroup.drops %}
<li> {{ numbers[loop.index][0] }} {{ mygroup.drops[i] | component }} {{ numbers[loop.index][1] }} </li>
{% endfor %}
</ul>
==

settings.feedback = lightscore

evaluator==
grade=mygroup.eval() # Ici ça bugge, mais c'est normal parce que le composant ne traverse pas
==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==




