@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
from random import randint, choice

# deux collections de symboles ici (on peut en rajouter à la suite...)
lists_symbols = [ ["a", "b", "d", "e", "f", "g", "h"], [1, 2, 3, 4, 5, 6, 7] ]

# ça va choisir un cardinal puis entre lettres et chiffres
cardinal_defi = randint(4, 7)
support_defi = choice(lists_symbols)[:cardinal_defi]

# nom de la fonction 
fct_name = choice


group.items = []
for i in range(4):
    group.items.append({
        "id": str(i),
        "content": str(random.randint(0, 100))
    })
==

title = Checkbox Group Component

text==
Soit {{  }}
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==


evaluator==#|python|

grade = (100, 'Right')
==

