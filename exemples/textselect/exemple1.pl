
# THIS EXAMPLE IS DEPRECATED SINCE THE COMPONENT WILL BE RENAMED SOON

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


selectable =: Text
selectable.text = The quick brown fox jumps over the lazy red dog.
selectable.mode = word
# le caractère séparateur devrait êêtre espace par défaut.

# Propriété du mot 
predicat=lambda s:"o" in s

# text= Select the names of animals in the sentence 
#predicat= lambda s: in ["fox","dog"]

# text= Select the names of colors in the sentence 
#predicat= lambda s: in ["red","brown"]

# text= Select the adjectives in the sentence 
#predicat= lambda s: in ["red","brown","lazy","quick"]


before==
selectable.separator = ' '
==

title==
Text Select Component
==

text==
Select the words containing **o**
==

form==
{{ selectable|component}}
==


evaluator==
textselected=''
f=eval(predicat)
good=sum([ 1 for x in selectable.text.split(selectable.separator) if f(x)])
bad = 0
for e in selectable.selections:
    textselected +=  e['content']+' '
    if f(e['content']):
        e['css'] = "success-state"
        good=good-1
    else:
        bad=bad+1

if bad == 0 and good==0:
    score = 100
    msg = '<span class="success-state animated pulse infinite">Good answer<span>'
else:
    score = 0
    msg = '<span class="error-state animated pulse infinite">Bad answer</span>'


grade = (score, msg)
==
