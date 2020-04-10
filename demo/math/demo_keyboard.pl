extends = /model/math.pl
@ /utils/components/mathinput.py [custommathinput.py]

input =: MathInput
input.decorator = CustomMathInput

form ==
{{ input|component}}
==

settings.feedback = rightwrong

settings.maxattempt % 1

