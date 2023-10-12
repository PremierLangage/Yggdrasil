
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
import random 
a = random.randint(567,789789)

==
 


text==
Saisir votre exercice ** {{ a }} **

==

form==
{{ inputbox|component}}
{{ editor|component }}
==


title==
prout 
{{ a }}
==

text==

# C'est du markdwon

## petit titre 

Enter the result of ** {{ a }} + {{ b }} ** inside the input box.



==



evaluator==
text=""
title=""
form=""
feedback = f"""

Ceci est affiché car c'est le feedback 
<br><br><br>
title={inputbox.value}     
text== . . 
{editor.code} . .  \n== . . 

"""

grade = (100, feedback)
==




