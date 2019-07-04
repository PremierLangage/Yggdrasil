extends = mathbasic2.pl
@ /input/checkbox/process.py [checkbox_process.py]
@ /input/checkbox/template.html [checkbox_template.html]
@ /input/checkbox/head.html [checkbox_head.html]


form ==
{{input_1}}
==

input.1.type = checkbox
input.1.shuffle = yes
input.1.choices = {{choices}}
input.1.numsol = {{numsol}}


