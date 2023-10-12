@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = Molecule editor

before ==

==

lang = fr

text ==
Dessiner la molécule de votre choix.
==


# ici, on va utiliser le formulaire décrit dans kekule-writter-formulaire.html
form=@kekule-writter-formulaire.html

# CE QUI EST BIZARRE c'est que les liaisons multiples n'apparaissent pas alors
# qu'il n'y a pas de problèmes pour template-2.pl
# fonction getSmile va recuperer dans mol ce qui est dans le fenetre de composer
# Kelule.IO.saveFormatData(mol, 'smi') va lire ce qui est dans mol comme format smile
# 
script=@kekule-writter-modul.js

evaluator ==
grade=(100,"Bonne réponse")
==





