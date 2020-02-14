@ /utils/sandboxio.py [sandboxio.py]
grader  =@ /grader/evaluator2.py
builder =@ /builder/before2.py
@ /utils/dragdrop.py [dragdrop.py]

title = 

before==
from dragdrop import Drop,Label,Drops,Labels
chiffres= [(2,4),(7,6),(5,3),(6,9)]
label=Labels(['g','h'])
drop10=Drop()
drops = [Drop(content=str(i)) for i in range(4)]
==

text==

==

form==
{{ label[0] | component }} {{ label[1] | component }}

{{ drop10| component }} 
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
f=str(drop10)
grade=(100,f)
==

