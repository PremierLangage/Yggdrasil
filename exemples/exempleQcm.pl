



extends=/ComputerScience/python/template/qcm_template.pl

title= template qcm

text= Cochez les affirmations correctes.

# Nombre de lignes total 
nb=4
# Nombre minimal de lignes "vraies"
nbtrues=2
# if nbtrues==0 then a random number 
# with at least one good answer ...

good==
La Lune tourne
0 est plus petit que 1 
Mars est dite: la planète rouge 
le sucre est blanc
le cheval blanc de Henri VI est blanc
==



bad==
La terre est plate 
Le soleil tourtne autour de la terre 
Les satellites de la lune sont rouges.
1 est plus petit que 0

==

before==

bad+=" Très mauvaise affirmation"
good += "\n celle ci est bonne par contre "
==

feedback=show


