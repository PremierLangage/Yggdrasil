

# THIS EXAMPLE IS DEPRECATED SINCE THE COMPONENT WILL BE RENAMED SOON

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


selectable =: Text
selectable.text = The quick brown fox jumps over the lazy red dog.
selectable.mode = word
# le caractère séparateur devrait êêtre espace par défaut.



before==
selectable.separator = ' '

# FIXME cela devrait plustot ^^ttre ceomme cela 
# pairs=[('Select the words containing **o**', 'lambda s:"o" in s')]
# predicat,text= pairs[random.randint(0,len(pairs)-1)]
# Propriété du mot 
lpredicat=['lambda s:"o" in s','lambda s: s in ["fox","dog"]','lambda s:s in ["red","brown"]','lambda s:s in ["red","brown","lazy","quick"]']
ltext=['Select the words containing **o**','Select the names of animals in the sentence ','Select the names of colors in the sentence ',' Select the adjectives in the sentence']
import random
indice=random.randint(0,len(lpredicat)-1)
predicat=lpredicat[indice]
text=ltext[indice]

==

title==
Text Select Component
==

text=

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
