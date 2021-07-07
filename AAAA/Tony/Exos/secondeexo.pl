extends = /model/basic/radio.pl

#Pour plusieurs réponses sélectionnables  : checkbox. indsol doit être la liste des indices de réponse.
#checkbox_rw pour entrer les bonnes réponses et les mauvaises : intéressant pour l'aléa : permet de donner 
#un ensemble de bonnes et mauvaises réponses et de définir le nb de bonnes/mauvaises réponses qu'il doit prendre. On peut modifier le barême.

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