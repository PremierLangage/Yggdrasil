


@ /utils/sandboxio.py
@ /builder/bbefore.py [builder.py]
@ /grader/evaluator.py [grader.py]

text=
form=

@ slides.md [slides.md]





title=Des slides pour vous  
beforeA==


def getfirstnomlancklineandcut(s):
    global text
    r=""

    l=s.split("\n")
    for i,line in enumerate(l):
        text += "--" + line + "-- \n"
        if line == "" :
            continue
        return (l[i],"\n".join(l[i+1:]))
    return ("","")

with open ("slides.md" , "r") as f:
    t=f.readlines()

slides=("\n".join(t)).split("\n***\n")
numero=0

docslides=[]
for s in slides:
    docslides.append(getfirstnomlancklineandcut(s))

slides=docslides
if numero<len(slides):
    text=slides[numero][1]+ f"   \n <p style='text-align:right;'>Slide {numero}</p> \n"
    title= slides[numero][0].strip("#") 


==


evaluator==

numero+=1
if numero<len(slides):
    text=slides[numero][1]+ f"   \n <p style='text-align:right;'>Slide {numero}</p> \n"
    title= slides[numero][0].strip("#") 
    grade=(0,"continuez")
else:
    grade=(100,"Bonne continuation")
==







selectable =: Text
selectable.text = Back Forward
selectable.mode = word

beforeB==
selectable.separator = ' '
==




form==
{{ selectable|component}}
==

evaluator==
score = 100

for e in selectable.selections:
    e['css'] = "error-state"
    if e['index'] in indices:
        e['css'] = "success-state"
        indices = [i for i in indices if i != e['index']]
    else:
        indices.append(e['css'])

==

