
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


0.621371 Mile = 1 Kilomêtres 

1 Gallon = 3.78541 litres 


Utiliser les constantes suivantes qui vous conviennent:

    M=0.621371 # Mile dans Km . . 
    G=3.78541 # litre dans Gallon . . 
    K=1.60934 # Km dans Mile . . 
    L=0.264172 # Gallon dans litre . . 

==

form==
{{ inputbox|component}}
==

evaluator==
M=0.621371 # Mile dans Km
G=3.78541 # litre dans Gallon
K=1.60934 # Km dans Mile
L=0.264172 # Gallon dans litre
sol=lambda C:100/((C/G)/L)
f=lambda C:eval(inputbox.value)
r=True
delta= -100
try:
    delta=f(40) - sol(40)
    if -0.01 < delta < 0.01 :
        r=True

except :
    r=False
if r:
    grade = (100, '<span class="success-state">Good 👏👏👏'+str(delta)+'</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎 '+str(delta)+'</span>')
==


