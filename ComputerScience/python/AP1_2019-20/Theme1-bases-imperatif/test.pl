# Boris Jabot 10/09/2019 OK
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

textbox1 =: Input
textbox1.type = number
textbox2 =: Input
textbox2.type = number
textbox3 =: Input
textbox3.type = number

before== #|python|
import random
N = 3
lst_composants = [textbox1, textbox2, textbox3]
var_1 = [random.randint(1, 10) for n in range(N)]
var_2 = [random.randint(1, 10) for n in range(N)]
ans = [var_1[n] + var_2[n] for n in range(N)]
==

evaluator== #|python|
cpt = 0
values = [textbox1.value, textbox2.value, textbox3.value]
for pos in range(len(values)):
    if values[pos] == ans[pos]:
        cpt += 1
grade = (int(cpt / 3 * 100), "Bravo")
==



title== #|html|
Addition aléatoire
==

text== #|html|
==

form== #|html|
<ul>
{% for comp in lst_composants %}
<li> $% {{var_1[loop.index0]}} %$ + $% {{var_2[loop.index0]}}  %$  = {{ comp|component }}  </li>
{% endfor %}
</ul>
==



