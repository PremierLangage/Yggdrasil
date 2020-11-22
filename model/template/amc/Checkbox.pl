
extends = /model/basic.pl



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
feedback = " "
score = checkbox.eval()
==

