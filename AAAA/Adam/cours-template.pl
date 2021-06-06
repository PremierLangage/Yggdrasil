
@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

text=
form= @cours-contenu.md [cours-contenu.md]
title = TITRE DE LA PRESENTATION

before==
import os 
print(os.path.dirname(os.path.realpath(__file__)))
with open ("cours-contenu.md" , "r") as f:
    t=f.readlines()

slides = ("\n".join(t)).split("***\n")
page = 0
==

evaluator==
page += 1

if page < len(slides):
    text = slides[page]
    title = f"{numero}/{len(slides)-1}"
    grade = (0, "Suivant")
else:
    grade=(100,"Fin de la présentation")
==


dummy.extracss==
<style>
.exercise__header {
  background: center no-repeat url("https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/PanoMontBlancHDR_edit_1.jpg/800px-PanoMontBlancHDR_edit_1.jpg");
  background-size: contain;
}
</style>
==



