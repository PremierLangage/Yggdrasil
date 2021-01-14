extends = /model/math.pl
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

evaluator ==
score, error = eval_expr(input.value, sol)
feedback = message[error]
==




