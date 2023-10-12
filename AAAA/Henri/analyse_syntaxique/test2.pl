@ /utils/sandboxio.py
@ cyk.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|py|
import cyk

N = 6
rules, good, bad = cyk.generate_input(seed, N)

text += '\n\n'
for r in rules:
    text += '    ' + cyk.format_rule(r, N) + '\n'

import random
nb_right = random.randint(1,2)
good = random.sample(good, nb_right)
bad = random.sample(bad, 4 - nb_right)

words = good + bad
random.shuffle(words)

group.items = []
for i in range(4):
    group.items.append({
        "id": str(i),
        "content": words[i]
    })
==

title = CYK

text==
En utilisant l'algorithme CYK, déterminez le(s) mot(s) reconnu(s) par la grammaire suivante:
==

form==
{{ group|component }}
==

evaluator==#|py|
right = 0
total = 0
for item in group.items:
    total += 1
    checked = item['checked']
    content = item['content']
    if content in good:
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'
    else:
        right += 1

grade = ((right / total) * 100, f'{right} / {total}')
==

settings.allow_reroll = true