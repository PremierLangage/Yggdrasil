extends = /model/math.pl
extends = /model/evalsympy_fdbk_msg_fr.pl
@ /utils/components/mathinput.py [custommathinput.py]

input1 =: MathInput
input1.decorator = CustomMathInput
input1.virtualKeyboards = elementary

input2 =: MathInput
input2.decorator = CustomMathInput
input2.virtualKeyboards = elementary

title = 

text = 

form ==
{{ input1|component}}
{{ input2|component}}
==

settings.feedback = rightwrong

settings.maxattempt % 1

