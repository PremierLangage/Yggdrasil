
@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

text=''
form=''

@ slide.md

title=les slides 
before==
with open ("slide.md" , "r") as f:
    t=f.readlines()

slides=("\n".join(t)).split("***\n")
numero=0

text=slides

title= f"les slides {numero}"

==


evaluator==
numero+=1
if not  numero==len(slides):
    text=slides[numero]
    title= f"les slides {numero}"
    grade=(0,"continuez")
else:
    grade=(100,"Bonne continuation")
==
