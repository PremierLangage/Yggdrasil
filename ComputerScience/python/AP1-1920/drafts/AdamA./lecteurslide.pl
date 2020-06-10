

@ /lib/builder/before.py [builder.py]
@ /lib/grader/evaluator.py [grader.py]



@ slide.md

title=les slides 
before==
with open ("slide.md" , "r") as f:
    t=f.readlines()

slides=t.split("***")
numero=0
text=slides[numero]

title= f"les slides {numero}"

==


evaluator==
numero+=1
text=slides[numero]

title= f"les slides {numero}"
==
