@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title= TITRE DE LA PRESENTATION
text= 

form= 
@cours-contenu.md [cours.md]

before==
with open ("cours.md" , "r") as f:
    txt = f.readlines()

slides = ("\n".join(txt)).split("---\n")
page = 0
==

evaluator==
page += 1

if page < len(slides):
    title = f"SLIDE {page}/{len(slides)-1}"
    text = slides[page]
    grade = (0, "Suivant")
else:
    grade = (100,"Fin de la présentation")
==


dummy.extracss==
<style>
.exercise__header {
  background: center no-repeat url("https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/PanoMontBlancHDR_edit_1.jpg/800px-PanoMontBlancHDR_edit_1.jpg");
  background-size: contain;
}
</style>
==



