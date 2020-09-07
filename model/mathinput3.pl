extends = /model/math.pl
@ /utils/components/mathinput.py [custommathinput.py]

input1 =: MathInput
input1.decorator = CustomMathInput
input1.virtualKeyboards = elementary

input2 =: MathInput
input2.decorator = CustomMathInput
input2.virtualKeyboards = elementary

input3 =: MathInput
input3.decorator = CustomMathInput
input3.virtualKeyboards = elementary

title = 

text = 

form ==
{{ input1|component}}
{{ input2|component}}
==

settings.feedback = rightwrong

settings.maxattempt % 1

