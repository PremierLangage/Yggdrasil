
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
@ /utils/sandboxio.py

editor =: CodeEditor
editor.theme = dark
editor.placeholder = L'énoncé
editor.language = python
editor.code ==
# write your code here
==

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Titre
inputbox.maxlength = 2
inputbox.appearance = outline




before==
==

title = Code Editor Component

text==
Saisir votre exercice
==

form==
{{ inputbox|component}}
{{ editor|component }}
==


title==
Input Component
==

text==
Enter the result of ** {{ a }} + {{ b }} ** inside the input box.
==



evaluator==
text=""
title=""
form=""
feedback = f"""
title={inputbox.value}     
text== . . 
{editor.code} . .  \n== . . 

"""

grade = (100, feedback)
==




