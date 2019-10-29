extends = /template/basic.pl

title = Plus petit nombre

@ /utils/radiogroup.py [customradiogroup.py]

radio =: RadioGroup
radio.decorator = CustomRadioGroup

before ==
import random as rd
content=rd.sample(list(range(50)),5)
radio.loadContent([str(item) for item in content])
radio.setSolByContent(str(min(content)))
radio.shuffle()
==

text ==
Sélectionner le plus petit nombre de la liste suivante.
==

form ==
{{ radio|component }}
==

evaluator ==
grade = radio.eval()
radio.disabled=True
==






