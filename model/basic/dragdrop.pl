extends = /model/basic.pl

settings.feedback = lightscore

title =

contents % []

footerbefore ==
from customdragdrop import CustomDragDrop
drops = []
labels = []

if isinstance(sol, str):
    _sol_ = sol.splitlines()
else:
    _sol_ = _sol_

if isinstance(contents, str):
    _contents_ = contents.splitlines()
else:
    _contents_ = contents

_contents_ = list(set(_contents_ + _sol_))

for content in _contents_:
    labels.append(CustomDragDrop.Label(content=content))

nbdrops = len(_sol_)

for _ in range(nbdrops):
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
    if drops[i].content == _sol_[i]:
        num_right += 1
        drops[i].css += "success-state"
    else:
        num_wrong +=1
        drops[i].css += "error-state"

if num_wrong > 0 :
    score = 0
else:
    score = 100
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
