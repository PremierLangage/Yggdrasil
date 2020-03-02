extends = /model/basic.pl

title = Multiples de 3 (Checkbox)

# Création du composant comme une clé
checkbox =: CheckboxGroup
@ /utils/components/checkbox.py [customcheckbox.py]
checkbox.decorator = CustomCheckbox

before ==
import random as rd
from customcheckbox import Thing

myobj = Thing('Awesome')

# Création du composant avec le constructeur
# from customcheckbox import CustomCheckbox
# checkbox = CustomCheckbox(content = ["a","b"])

mult3 = [str(n) for n in range(50,100) if n % 3 == 0]
other = [str(n) for n in range(50,100) if n % 3 != 0]

checkbox.loadrw(mult3,other,5,rd.randint(1,4))


checkbox.horizontal = False
==

text ==
Parmi les nombres suivants, lesquels sont des multiples de 3 ?
==

#settings.feedback = raw

form ==
{{ checkbox | component }}
==

evaluator ==
grade = checkbox.eval(grading="CorrectAnswers",display=True,disabled=False)
grade =(100,str(myobj))
==

