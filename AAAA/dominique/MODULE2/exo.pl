
extends= template.pl



title = Checkbox Group Component

text==
Select les nombres premiers inférieur a 15.
==

# GENERATE A RANDOM QUESTION
before==


listin = ['Jambon','Oeuf','Levure','Viande','chocolat','sucre']
indices= [False, True, False, False, True, True]

import random
group.items = []
for i,s in enumerate(listin):
    group.items.append({
        "id": str(i),
        "content": s
    })



==


evaluator==

right = 0
total = 0
for i,item in enumerate(group.items):
    checked = item['checked']
    content = int(item['content'])
    if indices[i] == True:
        total += 1
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'


if total == 0:
    grade = (100, 'Right')
else:
    grade = ((right / total) * 100, f"{right} / {total}")
==

