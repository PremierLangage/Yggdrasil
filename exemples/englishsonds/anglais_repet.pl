

@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

title =Take a listen


@ engflac.csv [content.csv] 

text==
listen  <audio controls><source src="http://monge.univ-mlv.fr/~dr/flac/{{solutionvalue}}"> </audio>
and select 
==

@ ../mkl.py

@ readcsv.py [readcsv.py]

before==
import random,readcsv, mkl

group.items,solution, debug = readcsv.getrandomselection(sourcecol="target",targetcol="source")

solutionvalue =random.choice(solution)

for i, it in enumerate(group.items):
    it['index'] = i
indexs = [ i for i,x in enumerate(solution) if x==solutionvalue ]

==

title = Checkbox Group Component exemple

text==

Indiquez les maladies causées par des {{solutionvalue}}

==



# EVALUATE THE STUDENT ANSWER
evaluator==
right = 0
total = 0
for item in group.items:
    checked = item['checked']
    iindex = item['index']
    if iindex in indexs:
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



