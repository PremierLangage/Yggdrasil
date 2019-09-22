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

var_1 = [random.randint(1, 10) for n in range(N)]
var_2 = [random.randint(1, 10) for n in range(N)]
op = random.choice(['+','*','-','/','//','%','**'])
ans = [eval(str(var_1[n])+op+str(var_2[n])) for n in range(N)]
==

evaluator== #|python|
cpt = 0
values = [textbox1.value, textbox2.value, textbox3.value]
for pos in range(len(values)):
    if values[pos] == ans[pos]:
        cpt += 1
grade = (int(cpt / N * 100), "Bravo")
==



title== #|html|
Addition aléatoire
==

text== #|html|
==

form== #|html|
<ul>
<li> $% {{var_1[0]}} %$ {{op}} $% {{var_2[0]}}  %$  = {{ textbox1|component }}  </li>
<li> $% {{var_1[1]}} %$ + $% {{var_2[1]}}  %$  = {{ textbox2|component }}  </li>
<li> $% {{var_1[2]}} %$ + $% {{var_2[2]}}  %$  = {{ textbox3|component }}  </li>
</ul>
==




