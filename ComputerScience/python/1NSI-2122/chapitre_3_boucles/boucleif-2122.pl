
# author zip
# modifié par emmanuel brunache

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl
@ /utils/plrandom.py

title = nombres divisibles

text =

code =

mplsoluce0 =

textf==  

Ecrire un programme qui lit {nb_entiers} entiers et affiche combien parmi eux sont divisibles par {diviseur}

(Remarque: on utilise l=int(input()) pour lire un chiffre dans ce programme)
==

codef==


print("Il y a",nb,"multiples de {diviseur}")
==

before == 
from random import randint, choice
from plrandom import sampleint
nb_entiers = randint(9,25)
diviseur = choice([3,5,7,11])
code = codef.format(diviseur = diviseur)
table = sampleint(1,1000,nb_entiers)
soluce = f"table = {table}\ndiviseur = {diviseur}\nnb_entiers={nb_entiers}\n"+solucef
mplsoluce0 = mplsolucef.format(table='\n'.join(str(val) for val in table))
text = textf.format(diviseur = diviseur, nb_entiers = nb_entiers)
==



solucef==
nb=0
for i in range(nb_entiers):
    l=int(input())
    if l%diviseur==0:
       nb+=1
print("Il y a",nb,"multiples de",diviseur)
==

mplsolucef==
test
{table}
==