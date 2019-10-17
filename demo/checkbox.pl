@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/checkbox.py [customcheckbox.py]

title = Question à choix multiples (radio)

checkbox =: CheckBox
checkbox.decorator = CustomCheckBox

before ==
checkbox.loadContent(["Paris","Bruxelles","Lyon","Genève"])
checkbox.shuffle()
==

text = Quelle est la capitale de la France ?

form = {{ checkbox|component }}

evaluator ==
grade = checkbox.evalByContent(["Paris","Lyon"])
==

