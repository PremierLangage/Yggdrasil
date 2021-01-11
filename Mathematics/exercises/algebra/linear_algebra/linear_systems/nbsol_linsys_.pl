# Author : D. Doyen
# Last update : 09/01/21
# Keywords : linear systems

extends = /model/math/math.pl
extends = /model/basic/radio.pl

shuffle % false

choices ==
Une unique solution
Une infinité de solutions
Aucune solution
==

title = Nombre de solutions d'un sytème 3x3



text ==
On considère le système suivant (d'inconnues $!x, y, z !$) :
$$ {{system}} $$
Combion de solutions possède ce système ?
==

