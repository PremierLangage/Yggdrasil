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
feedback = response['pouet']
note = 100
grade = (note, feedback)
==
