

@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

text=
form=

@ slides.md [slides.md]

title=Des slides pour vous  
before==


def getfirstnomlancklineandcut(s):
    global text
    r=""

    l=s.split("\n")
    for i,line in enumerate(l):
        text += line + "-- \n"
        if l == "" :
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



==


evaluator==
numero+=1
if numero<len(slides):
    text=slides[numero][1]+ f"   \n Slide {numero} \n"
    title= slides[numero][0].strip("#")
    grade=(0,"continuez")
else:
    grade=(100,"Bonne continuation")
==





