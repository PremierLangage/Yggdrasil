
extends= template.pl



title = Checkbox Group Component

text==
Select les nombres premiers inférieur a 15.
==


evalfunc==
def evalf(x):
    return x %2 == 0

evaluator==
eval(evalfunc)
right = 0
total = 0
for item in group.items:
    checked = item['checked']
    content = int(item['content'])
    if evalf(content):
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

