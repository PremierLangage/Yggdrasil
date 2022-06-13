extends = /model/basic/textinput.pl


before ==
f = open('pays_europe.csv')
row = csv_choice(f)
capitale = row['capitale']
sol = row['pays']
==

question ==
Ecrire le nom de la couleur en anglais.

<svg width="50" height="50">
<rect width="50" height="500" style="fill:{{ color }}" />
</svg> 
==
