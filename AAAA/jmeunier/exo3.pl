radio =: RadioGroup


before ==
import random as rd 
numbers=rd.sample(list(range(50)),5)
radio.loadContent([str(item) for item in numbers
sol = min(numbers)
radio.setSolByContent(str(sol))
==

text ==
Sélectionner le plus petit nombre.
==

form ==
{{ radio|component}}
==


evaluator == 
grade = radio.eval()
radio/disabled=True
==


