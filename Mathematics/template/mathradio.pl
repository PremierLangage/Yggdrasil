extends = /Mathematics/template/mathbasic.pl

@ /utils/radiogroup.py [customradiogroup.py]

radio =: RadioGroup
radio.decorator = CustomRadioGroup

form = {{ radio|component }}

evaluator ==
grade = radio.eval()
radio.disabled=True
score,feedback=grade
==
