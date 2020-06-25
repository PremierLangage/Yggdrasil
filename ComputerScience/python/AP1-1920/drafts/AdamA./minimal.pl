@ /utils/sandboxio.py
grader =@ /grader/evaluator.py

title=Bon ben voilà un titre

text==
Bon ben voilé un énoncé...
==

form==
<input type="text" id="form_pouet" name="fname">
==

evaluator==#|python|
feedback = "J'ai bien lu votre formulaire" + response['pouet']
note = 100
erreur de syntaxe....
grade = (note, feedback)
==
