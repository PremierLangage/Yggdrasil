extends = /model/basic.pl

title = Multiples de 3 (Checkbox)

# Création du composant comme une clé
checkbox =: CheckboxGroup
@ /utils/components/checkbox.py [customcheckbox.py]
checkbox.decorator = CustomCheckbox

before ==
import random as rd

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

settings.feedback = lightscore

form ==
{{ checkbox | component }}
==

evaluator ==
grade = checkbox.eval(grading="CorrectAnswers",display=False,disabled=False)
for item in checkbox.items:
    item['css']='myclass'
==

extracss ==
<style>
.myclass {
    float: left;
}
.myclass::after {
    font-family: "Font Awesome 5 Free";
    content: "\f00c";
    position : relative;
    vertical-align: middle;
    font-weight: 900;
}
</style>
==


