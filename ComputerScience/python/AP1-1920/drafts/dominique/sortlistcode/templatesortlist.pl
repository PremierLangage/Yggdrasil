
@ /utils/sandboxio.py
grader  =@ /exemples/sortlist/grader.py
builder =@ /exemples/sortlist/builder.py

@ /exemples/sortlist/sortlistcsvutils.py [utils.py]

# DECLARATION
sortlist =: SortList

sortlist.items %= #|json|
[ ]
==

# FORM
title = Sort List Component
text = *Drag and Drop the items to sort the list*
form = {{ sortlist|component }}


# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state animated fadeIn'
    if e['id'] != answer[i]:
        e['css'] = 'error-state animated fadeIn'
        errors += 1

if errors == 0:
    grade = (100, '<span class="success-state animated pulse infinite">Good answer</span>')
else:
    grade = (0, f'<span class="error-state animated pulse infinite">{ errors } wrong answers</span>')
==

