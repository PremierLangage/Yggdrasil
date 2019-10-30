extends = /template/basic.pl

title = Multiples de 3

@ /utils/checkbox.py [checkbox.py]

checkbox =: CheckboxGroup
checkbox.decorator = Checkbox

settings.feedback.class = score

before ==
import random as rd
mult3 = [n for n in range(50,100) if n%3 == 0]
other = [n for n in range(50,100) if n%3 != 0]
nchoices = 5
nright = rd.randint(1,nchoices-1)
choices = rd.sample(mult3,nright)+rd.sample(other,nchoices-nright)
checkbox.loadContent([str(number) for number in choices])
checkbox.setSolByIndex(list(range(k)))
checkbox.shuffle()
checkbox.grading="RightMinusWrong"
==

text = Parmi les nombres suivants, lesquels sont des multiples de 3 ?

form = {{ checkbox|component }}

evaluator ==
grade = checkbox.eval()
checkbox.disabled=True
==

extracss ==
<style>
.success-border2 {
    border: 1px solid transparent;
    border-radius: .25rem;
    border-color: #007E33 !important;
}
</style>
==





