@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/radiogroup.py [customradiogroup.py]

title = Question à choix multiples

radio =: RadioGroup
radio.decorator = CustomRadioGroup

before ==
radio.loadContent(["A","B","C","D"])
==

text = Select the right answer

form = {{ radio|component }}

evaluator ==
grade = radio.evalByContent("B")
==




