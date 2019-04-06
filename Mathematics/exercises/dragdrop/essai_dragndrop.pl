extends = /template/mathdragdrop.pl

title = Appartenance et inclusion

lang = fr

before ==

style = 'width: 3em; height: 2em'
drag_tags = [
    {'name':'in', 'display':'$$\in$$', 'style':style},
    {'name':'subset', 'display':'$$\subset$$', 'style':style},
    {'name':'maman', 'display':'😍', 'style':style}]
drop_tags = [{'name':'in', 'display':'', 'style':style}, 
 {'name':'subset', 'display':'', 'style':style}]

==

text== 
Ayez l'obligeance de bien vouloir remplir les cases vides ci-dessous avec le symbole approprié.

== 

form==
$% 1 %$ {{ input_drop_in | safe }} $%\{1,2,3\}%$
<br>
$% \{1\} %$ {{ input_drop_subset | safe }} $%\{1,2,3\}%$

<br>
<br>
Symboles : {{ input_drag_in | safe }} {{ input_drag_subset | safe }}
{{ input_drag_maman | safe }}

==

evaluator ==
if (answer['drag_in'] == 'drop_in') and  (answer['drag_subset'] == 'drop_subset'): 
    score = 100
    numerror = 0
else : 
    score = 0
    numerror = 1

solution = ''
feedback = ''
==











