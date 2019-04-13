extends = /Mathematics/template/mathdragdrop.pl

title = Appartenance et inclusion

lang = fr

before ==

style = 'width: 3em; height: 2em'
drag_in = render_drag_tag({'name':'in', 'display':'$$\in$$', 'style':style})
drag_subset = render_drag_tag({'name':'subset', 'display':'$$\subset$$', 'style':style})
drag_maman = render_drag_tag({'name':'maman', 'display':'😍', 'style':style})
drop_in = render_drop_tag({'name':'in', 'display':'', 'style':style}) 
drop_subset = render_drop_tag({'name':'subset', 'display':'', 'style':style})

==

text== 
Ayez l'obligeance de bien vouloir remplir les cases vides ci-dessous avec le symbole approprié.

== 

form==
$% 1 %$ {{ drop_in | safe }} $%\{1,2,3\}%$
<br>
$% \{1\} %$ {{ drop_subset | safe }} $%\{1,2,3\}%$

<br>
<br>
Symboles : {{ drag_in | safe }} {{ drag_subset | safe }}
{{ drag_maman | safe }}

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












