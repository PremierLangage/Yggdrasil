



extends=/ComputerScience/python/template/qcm_template.pl

title= Exemple de QCM

text= Cochez les affirmations correctes.

# Nombre de lignes total 
nb=4
# Nombre minimal de lignes "vraies"
nbtrues=2
# if nbtrues==0 then a random number 
# with at least one good answer ...

good==
La Lune tourne | Autour de la terre 
0 est plus petit que 1 | Heureusement 
Mars est dite: la planète rouge 
le sucre est blanc
le cheval blanc de Henri VI est blanc
==



bad==
La terre est plate | Non vous exagerez la !
Le soleil tourne autour de la terre | Vous avez raté le révolution copernicienne 
Les satellites de la lune sont rouges. | Vos yeux sont rouges ...
1 est plus petit que 0 | En nombre de pixels ??
La réponse D |
==

before==
bad+=" Très mauvaise affirmation"
good += "\n celle ci est bonne par contre | Bravo !!"
==

feedback=show


