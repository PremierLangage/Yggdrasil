# DR 10/09/2020
tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl

title= Une médaille 

text==

La fonction metal fournis le niveau sportif "Or","Argent", "Bronze", et "Neige" de participant avec
 les règles suivantes , il y a trois épreuves ou l'on optient de 0 à 6 points

Niveau Or : 4 ou plus a chaque épreuves et au moins  13 au total.

Niveau Argent : 3 ou plus a chaque épreuves et au moins  10 au total.

Niveau Bronze : 2 ou plus a chaque épreuves et au moins  7 au total.

Niveau Neige : pas de conditions. 

Exemple de doctest :

    >>> metal(5,6,4)
    'Or'


==

pltest0==
>>> metal(5,6,4)
'Or'
>>> metal(5,3,4)
'Argent'
>>> metal(3,2,2)
'Bronze'
>>> metal(1,6,6)
'Neige'
==

editor.code==
def metal


==
editor.height=145
