
tag=expression


@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Answer
inputbox.maxlength = 12
inputbox.appearance = outline

before==

==

title==
Input Component
==

text==

Aux US la consomation des véhicules est exprimé en Miles par Gallons.
Nous utilisons des litres aux 100 Kilomêtres. 

On suppose que l'on nous donne la valeur C comme nombre de Miles par Gallon.
Donner l'expression qui permet de la convertir en litre par 100 Kilomêtres.

0.621371 Mile = 1 Kilomêtres . . 
1 Gallon = 3.78541 litres . . 


==

form==
{{ inputbox|component}}
==

evaluator==

f=lambda C:inputbox.value
r=True
try:
    if f(40)== sol(40) :
        r=True

except :
    r=False
if r:
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')
==


