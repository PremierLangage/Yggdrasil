# DR: test 24/09/2019 OK
extends=../../templates/pltest.pl
@ /builder/before.py [builder.py]

tag=Programmation|Python|Initialisation|Variable
author = CC + DR

title = Initialisation et constantes


text==
Ecrire un programme python qui lance deux dés succéssivement, le premier
étant le défenseur et le second l'attaquant. Le défenseur gagnera si et 
seulement si le nombre sorti est supérieur ou égal au nombre sorti par
l'attaquant.
==



editor.height = 80

soluce == 
import random 
random.seed(seed)
defenseur = random.choice([1,2,3,4,5,6])
attaquant = random.choice([1,2,3,4,5,6])
if defenseur >= attaquant :
    print("Défenseur a gagné")
print("Attaquant a gagné")
==






