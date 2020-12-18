extends = /model/basic.pl

settings.feedback = lightscore

title =

footerbefore ==
from customdragdrop import CustomDragDrop
drops = []
labels = []

if isinstance(dropsolutions, str):
    lstdropsolutions = dropsolutions.splitlines()
else:
    lstdropsolutions = dropsolutions

if 'labelcontents' in globals():
    if isinstance(labelcontents, str):
        list_labelcontents = labelcontents.splitlines()
    else:
        list_labelcontents = labelcontents
else:
    list_labelcontents = list(set(lstdropsolutions))

for content in list_labelcontents:
    labels.append(CustomDragDrop.Label(content=content))

nbdrops = len(lstdropsolutions)
for _ in lstdropsolutions:
    drops.append(CustomDragDrop.Drop())
==

text =

scheme =$ /Biology/media/550px-Cranial_bones_numbers.svg.png

form ==
<img src="{{scheme}}" style="max-width: 300px; vertical-align:top; display: inline-block"> 
<ul>
{% for i in range(nbdrops) %}
<li> {{ i + 1 }}. {{ drops[i]|component }} </li>
{% endfor %}
</ul>

{% for label in labels %}
{{ label|component }}
{% endfor %}
==

evaluator ==
n = len(drops)
num_right = 0
num_wrong = 0

for i in range(n):
    if drops[i].content == lstdropsolutions[i]:
        num_right += 1
        drops[i].css += "success-state"
    else:
        num_wrong +=1
        drops[i].css += "error-state"

if num_wrong > 0 :
    score = num_right
else:
    score = 100

score = 100*n + 10*num_right + num_wrong
==



style.dragdrop ==
.drag-drop-component {
    position: relative;
    cursor: move;
    display: inline-flex;
    padding: 0px;
    box-sizing: border-box;
    min-width: 3em;
    min-height: 2em;
    vertical-align: middle;
    text-align: center;
    justify-content: center;
    align-items: center;
    border: 0px solid transparent;
    border-radius: 0px;
    margin: 0px;
}

.drag-drop-component.droppable {
    border: 0px solid #000;
}

.drag-drop-component.droppable.dnd-over,.drag-drop-component.droppable:hover{
    border:0px solid #000
}
==
