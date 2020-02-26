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
grade = checkbox.eval(grading="CorrectAnswers",display=True,disabled=False)

==

extracss ==
<style>
.success-state {
    border: 1px solid transparent;
    border-radius: 0.25rem;
    color: #155724 !important;
    background-color: #d4edda !important;
    border-color: #c3e6cb !important;
}

.success-state p::after {
    font-family: "Font Awesome 5 Free";
    color : green;
    content: "  \f00c";
    vertical-align: middle;
    font-weight: 900;
}

</style>
==


