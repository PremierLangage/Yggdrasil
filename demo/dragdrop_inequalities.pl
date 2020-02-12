@ /utils/sandboxio.py
grader  =@ /grader/evaluator2.py
builder =@ /builder/before2.py

drag1 =: DragDrop
drag1.content = $$\in$$

drag2 =: DragDrop
drag2.content = $$\subset$$

title = 

before==

drops = []
for i in range(len(sets)):
    drop = DragDrop(
        id=f"drop{i}",
        droppable=True
    )
    drops.append(drop)

==

text==
==

form==
{{ drag1|component }}
{{ drag2|component }}
<br/>

<ul>
    {% for e in sets %}
    <li>
        {{ e[0] }}
        {{ drops[loop.index0]|component }}
        {{ e[2] }}
    </li>
    {% endfor %}
</ul>
==

evaluator==
errors = 0
for i, e in enumerate(sets):
    drop = globals()[f'drop{i}']
    drop.css = 'success-state animated rotateIn'
    if drop.droppedId != e[1]:
        drop.css = 'error-state animated pulse infinite'
        errors += 1

n = len(sets)
if errors == 0:
    grade = (100, f'<span class="success-state animated pulse infinite">{n}/{n}</span>')
else:
    grade = (100, f'<span class="error-state animated pulse infinite">{n - errors}/{n}</span>')
==
