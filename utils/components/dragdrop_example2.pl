extends = /model/basic.pl

@ /utils/components/dragdrop.py [customdragdrop.py]

title = Comparaison de nombres (DragDrop)

before==#|python|
import random as rd
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

lt="$%\lt%$" # latex for "less than"
gt="$%\gt%$" # latex for "greater than"

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

# La suite du before ne sert qu'à faire passer les infos dans "form" et "grader"

a = mygroup.labels['lt']
b = mygroup.labels['gt']
c1 = mygroup.drops['1']
c2 = mygroup.drops['2']
c3 = mygroup.drops['3']
c0 = mygroup.drops['0']
match = mygroup._matches
==

text==
Comparer les nombres suivants avec les symboles {{ a | component }} et {{ b | component }}.
==

form==
<ul>
<li> {{ numbers[0][0] }} {{ c0 | component }} {{ numbers[0][1] }} </li>
<li> {{ numbers[1][0] }} {{ c1 | component }} {{ numbers[1][1] }} </li>
<li> {{ numbers[2][0] }} {{ c2 | component }} {{ numbers[2][1] }} </li>
<li> {{ numbers[3][0] }} {{ c3 | component }} {{ numbers[3][1] }} </li>
</ul>
==

settings.feedback = lightscore

evaluator==#|python|
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

#my_group = DragDropGroup(labels = {'lt':a, 'gt': b}, drops = {'0' : c0, '1': c1, '2': c2, '3': c3}, matches = match)

#grade=mygroup.eval() # Ici ça bugge, mais c'est normal parce que le composant ne traverse pas
score = 100
==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==







