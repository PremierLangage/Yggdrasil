extends = basic.pl

radio =: RadioGroup
radio.decorator = CustomRadio

form = {{ radio|component }}

evaluator ==
grade = radio.eval()
radio.disabled=True
==

