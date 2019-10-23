extends = basic.pl

@ /utils/radiogroup.py [customradiogroup.py]

title = Question à choix multiples (radio)

radio =: RadioGroup
radio.decorator = CustomRadioGroup

before ==
content=rd.sample(list(range(50)),5)
radio.loadContent([str(item) for item in content])
radio.setSolByContent(str(min(choices)))
radio.shuffle()
==

text ==
Sélectionner le plus petit nombre de la liste suivante.
==

form = {{ radio|component }}

evaluator ==
grade = radio.eval()
==
