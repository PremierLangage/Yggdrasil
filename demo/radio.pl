@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/radiogroup.py [customradiogroup.py]

title = Question à choix multiples (radio)

radio =: RadioGroup
radio.decorator = CustomRadioGroup

before ==
radio.loadContent(["Paris","Lille","Lyon","Marseille"])
radio.setSolByContent("Paris")
radio.shuffle()
==

text = Quelle est la capitale de la France ?

form = {{ radio|component }}

evaluator ==
grade = radio.eval()
==





