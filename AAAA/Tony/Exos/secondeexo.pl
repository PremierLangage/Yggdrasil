extends = /model/basic/radio.pl

#Pour plusieurs réponses sélectionnables  : checkbox. indsol doit être la liste des indices de réponse.

question ==
Quelle est la couleur du cheval blanc d'Henri 4?
==

#Par défaut le premier item est la bonne réponse, et les items sont mélangés
items ==
blanc
noir
je sais pas je suis daltonien
la réponse d
==

#indice de la solution
indsol = 0 
shuffled = False