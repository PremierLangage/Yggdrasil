extends = /template/basic.pl

title = Multiples de 3

@ /utils/checkbox.py [checkbox.py]

checkbox =: CheckboxGroup
checkbox.decorator = Checkbox

settings.feedback.class = score

before ==
import random as rd
mult3=[n for n in range(50,100) if n%3==0]
other=[n for n in range(50,100) if n%3!=0]
k=rd.randint(1,4)
choices = rd.sample(mult3,k)+rd.sample(other,5-k)
checkbox.loadContent([str(item) for item in choices])
checkbox.setSolByIndex(list(range(k)))
checkbox.shuffle()
checkbox.grading="RightMinusWrong"
==

text = Parmi les nombres suivants, lesquels sont des multiples de 3 ?

form = {{ checkbox|component }}

evaluator ==
grade = checkbox.eval()
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





