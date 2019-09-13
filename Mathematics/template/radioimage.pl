@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /input/radioimage/process.py [radio_process.py]
@ /input/radioimage/template.html [radio_template.html]
@ /input/radioimage/head.html [radio_head.html]

title = Champ de réponse RadioImage

lang = fr

before ==
pass
==

text ==
Sélectionner le drapeau de la Suède.
==

form ==
{{input_1}}
==

input.1.type = radio

input.1.shuffle = yes

input.1.choices ==
["https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/320px-Flag_of_Norway.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Sweden.svg/320px-Flag_of_Sweden.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Denmark.svg/317px-Flag_of_Denmark.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Finland.svg/320px-Flag_of_Finland.svg.png"]
==

input.1.numsol = 0

evaluator ==
if answer['1']['eval']==True:
    score=100
else:
    score=0
==

