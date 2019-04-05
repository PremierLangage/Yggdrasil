extends = mathbasic.pl
mathexpr_template =@ /input/mathexpr/template.html
mathexpr_process_config =
mathexpr_head =@ /input/mathexpr/head.html
mathexpr_process_answer =

form ==
{{input_1 | safe}}
==

input.1.type = mathexpr

input.1.virtualKeyboardMode = manual

input.1.virtualKeyboards = elementary








