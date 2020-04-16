
extends=/model/progpython.pl

@ lefichier.py [anthony.py] 
@ /grader/evaluator.py [grader.py]

evaluator==
from anthony import killthermall

killthemall(editor.code)

if editor.code=="":
    grade=(100," tout c'est pas jhlsdfj ghlbien passé")
else:
    grade=(100," tout c'est bien passé")
==
