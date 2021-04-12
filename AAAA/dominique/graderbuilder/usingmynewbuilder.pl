

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
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/scoring.py


title = Multiples de 3 (Checkbox)

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

before ==
import random as rd

mult3 = [str(n) for n in range(50,100) if n % 3 == 0]
other = [str(n) for n in range(50,100) if n % 3 != 0]

checkbox.setdata_from_rw(mult3, other, 5, rd.randint(1, 4))
==

text ==
Parmi les nombres suivants, lesquels sont des multiples de 3 ?
==

settings.feedback = lightscore

form ==
{{ checkbox|component }}
==

evaluator ==
score = checkbox.eval()


feedback = f"{score} !"
grade = (score, feedback)
==

