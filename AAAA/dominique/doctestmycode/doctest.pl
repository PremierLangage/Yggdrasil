
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/none.py

editor =: CodeEditor
editor.theme = light
editor.language = python
editor.code ==
"""# n'oublier pas une chaine multiligne est inspectée par doctest pour y trouver des tests   
>>> import math # Ici le test c'est pour savoir si il y a l'import math sur PlaTon :)   
>>> math.pi   
3   
>>> f(3)
4
"""

def f(n):
    return n+1

==



title = Tester votre code 

text==
Saisissez dans l'éditeur un code avec un doctest.
L'évaluation vous donnera le résultat du test.

L'exemple de code dans l'éditeur vas vous retourner un test incorrect (pi != 3). 
Quand cela ce passe bien rien n'est affiché !!!! 

==

form==
{{ editor|component }}
==

evaluator==
import doctest
import io
import sys

with open("student.py","w") as f:
    print(editor.code,file=f)
import student 

oldout=sys.stdout 
sys.stdout=io.StringIO()
failurecount,testscount = doctest.testmod(student,name="Votre code")
sortie= sys.stdout.getvalue()
sys.stdout = oldout 

if testscount == 0:
    grade = (0, "il n'y a pas de doctest dans votre fichier.")
elif sortie :
    grade = (100, f"Test result \n<pre>"+sortie+"\n</pre>")
else:
    grade = (100,f" Bravo vos {testscount} tests sont tous passés.")

==

