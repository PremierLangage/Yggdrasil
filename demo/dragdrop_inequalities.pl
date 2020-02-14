@ /utils/sandboxio2.py [sandboxio.py]
grader  =@ /grader/evaluator2.py
builder =@ /builder/before2.py
@ /utils/dragdrop.py [dragdrop.py]


title = 

before==
from dragdrop import Drop,Label

drag1 = Label(content=r"\>")
drag2 = Label(content="<")

chiffres= [(2,4),(7,6),(5,3),(6,9)]

drops = [Drop() for i in range(4)]

for drop in drops:
    globals()[drop.id] = drop

#s=str(globals().keys())

==

text==
{{s}}
==

form==
{{ drag1|component }}
{{ drag2|component }}
<br/>

<ul>
    {% for i in range(4) %}
    <li>
        {{ chiffres[i][0] }}
        {{ drops[i]|component }}
        {{ chiffres[i][1] }}
    </li>
    {% endfor %}
</ul>
==

evaluator==
grade=(100,drag1.value)
==

