
@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

text=
form=

@ slide.md [slides.md]

title=Des slides pour vous  
before==
with open ("slides.md" , "r") as f:
    t=f.readlines()

slides=("\n".join(t)).split("***\n")
numero=0

#text=slides


==


evaluator==
numero+=1
if numero<len(slides):
    text=slides[numero]
    title= f"les slides {numero}"
    grade=(1,"continuez")
else:
    grade=(100,"Bonne continuation")
==


dummy.extracss==
<style>
.exercise__header {
background: center no-repeat url("https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/PanoMontBlancHDR_edit_1.jpg/800px-PanoMontBlancHDR_edit_1.jpg");
background-size: contain;
}
</style>
==


