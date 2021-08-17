
tag=expression|conversion

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Formule de calcul
inputbox.maxlength = 12
inputbox.appearance = outline

before==

==

title==
Conversion mpg en l/km
==

text==

Aux US la consommation des véhicules est exprimée en Miles par Gallons (mpg).
Nous utilisons des litres aux 100 Kilometres. 

On suppose que l'on nous donne la valeur **C** comme nombre de Miles par Gallon.
Donner l'expression qui permet de la convertir en litres pour 100 Kilomêtres.

Deux exemples:

36 mpg donne du 6,5 litres aux 100 Kilometres.

27 mpg donne du 8,7 litre aux 100 Kilometres.

Utiliser parmis les constantes suivantes celles qui vous conviennent:

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
sol=lambda C:100/((C/G)*K)
f=lambda C: eval(inputbox.value)
r=False
delta= -100
feedback=' pas le bon calcul'
try:
    delta= (f(40) - sol(40))
    r=-0.01 < delta and delta < 0.01
except :
    feeback='problèmes dans votre formule '
    r=False
if r:
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎 </span>')
==



