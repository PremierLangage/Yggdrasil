@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: RadioGroup

# GENERATE A RANDOM QUESTION
before==
==

title = Radio Group Component

text==
Comment percevez-vous Platon 
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==
S = group.selection
score = 0
feedback = '<span class="error-state animated pulse infinite">Bad answer</span>'

for item in group.items:
    item['css'] = ''
    if item['id'] == S:
        if S == R:
            item['css'] = 'success-border'
            score = 100
            feedback = '<span class="success-state animated pulse infinite">Good answer</span>'
        else:
            item['css'] = 'error-border'
    elif item['id'] == R:
        item['css'] = 'success-border animated pulse infinite'

grade = (score, feedback)
==

