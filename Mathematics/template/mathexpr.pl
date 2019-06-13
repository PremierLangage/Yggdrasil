extends = mathbasic2.pl
@ /input/mathexpr/template.html [mathexpr_template.html]
@ /input/mathexpr/head.html [mathexpr_head.html]
@ /input/mathexpr/process.py [mathexpr_process.py]

form ==
{{input_1 | safe}}
==

input.1.type = mathexpr

input.1.virtualKeyboardMode = manual

input.1.virtualKeyboards = elementary












