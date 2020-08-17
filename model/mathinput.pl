extends = /model/math.pl
extends = /model/evalsympy_fdbk_msg_fr.pl
@ /utils/components/mathinput.py [custommathinput.py]

input =: MathInput
input.decorator = CustomMathInput

input.virtualKeyboards = elementary

title = 

text = 

form ==
{{ input|component}}
==

settings.feedback = rightwrong

settings.maxattempt % 1



