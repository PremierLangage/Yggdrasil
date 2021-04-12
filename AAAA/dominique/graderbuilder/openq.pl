


# Méthode 1 privilégiée maintenant 
@ /builder/simplebefore.py [builder.py]
@ /grader/simpleeval.py [grader.py]

evaluatorname=evaluator


# Méthode 2 version historique 
#grader  =@ /grader/evaluator.py
#builder =@ /builder/before.py


# les utils devraient être sur la sandbox 
# donc plus besoin de les inclures dans le context
@ /utils/sandboxio.py

@ /utils/components/scoring.py



inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse
inputbox.appearance = standard
inputbox.css = myclass


before==
import random

a = random.randint(1, 10)
b = random.randint(1, 10)
r = a + b
==

title==
Input Component
==

text==

==

form==
Let see : ** {{ a }} € + {{ b }} € ** equals {{ inputbox|component}} € et des poussières.   
Poussières que l'on ignorera ! 
==

evaluator==
if r == inputbox.value:
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')
==

extracss ==
<style>
.myclass {
    color: red !important;
    font-size: 24px !important;
    box-sizing: content-box;
}
.myclass.mat-form-field {
width:unset;
}
</style>
==
