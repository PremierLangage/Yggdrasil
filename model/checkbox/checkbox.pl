
extends = /model/basic.pl

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox



settings.feedback = lightscore

form ==
{{ checkbox|component }}
==

evaluator ==
feedback = " "
score = checkbox.eval()
==


