@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = Molecule editor

before ==

==

lang = fr

text ==
Dessin d'une molecule.
==

# ici, on va utiliser le formulaire décrit dans smiledraw-formulaire.html
form=@smiledraw-formulaire.html

#script=@smiledraw.js

evaluator ==
grade=(100,"Bonne réponse")
==





