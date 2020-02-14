@ /utils/sandboxio.py [sandboxio.py]
grader  =@ /grader/evaluator2.py
builder =@ /builder/before2.py

title = 

before==
class Foo(object):
    def __init__(self, x, y=0):
        self.x = x
        self.y = y

myFoo = Foo(1,2)

chiffres= [(2,4),(7,6),(5,3),(6,9)]

drops = [DragDrop(id=str(i),droppable=True,content="3") for i in range(4)]

#for drop in drops:
#    globals()[drop.id] = drop

s=globals().copy()

==

text==
{{s}}
==

form==

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
grade=(100,"")
==

