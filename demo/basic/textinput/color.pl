extends = /model/basic/textinput.pl

before ==
sol = choice(["blue", "red", "green", "yellow"])
==

question ==
Ecrire le nom de la couleur en anglais.

<svg width="50" height="50">
<rect width="50" height="500" style="fill:{{ sol }}" />
</svg> 
==
