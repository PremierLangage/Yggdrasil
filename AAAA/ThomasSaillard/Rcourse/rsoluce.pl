
doc==
Rsoluce.pl est un modèle permettant d'executer des programmes R.

Le but de ce modèle est de prendre un code `bon` du professeur et de le comparer à celui de l'élève via 
différents tests écrits par le professeur.

La seule balise à définir obligatoirement : 

    soluce==
    Un script R répondant à l'éxercice.
    ==

Les balises optionnelles : 
    testX==
    Nom du test
    entrée 1
    entrée 2 
    entrée 3
    ==

    Notez que les entrées sont passées au programme par l'entrée standart.
    Il peut ne pas y avoir d'entrée du tout.
    Dans le cas où aucun test n'a été défini les deux scripts seront quand même
    éxécutés et comparés sans aucune entrée.

