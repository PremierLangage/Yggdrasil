extends = basic.pl

@ /utils/checkbox.py [checkbox.py]

checkbox =: CheckboxGroup
checkbox.decorator = Checkbox

settings.feedback.class = score

form ==
{{ checkbox | component }}
==

evaluator ==
grade = checkbox.eval()
checkbox.disabled=True
==




