#author=Dominique Revuz 

title= Lecture d'un entier

tag=input|print|variable|type

extends=/ComputerScience/python/AP1-1920/templates/prosoluce.pl
 

@ /builder/before.py [builder.py]

soluce==
a=int(input())
print("Le capitaine a %d ans. Dans {{X}} ans il aura %d ans." % (a,a+{{x}}))
print("Le perroquet du capitaine a actuellement %d ans." % (((a+{{y}})//{{z}})-{{y}}))
==

code==
# lecture au clavier et transformation en entier puis affectation
age=int(input())
# Le capitaine a __ ans. Dans {{X}} ans il aura __ ans.
# Le perroquet du capitaine a actuellement __ ans.
==


text==
**(1)** Ecrivez un programme utilisant une unique variable **age** qui lit un entier (un age) au clavier puis affiche la phrase :

	"Le_capitaine_a_XX_ans._Dans_{{X}}_ans_il_aura_YY_ans."

<u>Information</u> : les "\_" représentent des espaces. Naturellement vous afficherez les espaces et pas les "\_" ! 

<br>  

**(2)** Puis, sachant que dans {{Y}} ans, le perroquet aura {{Z}} de l’âge du capitaine (arrondi à l'année inférieure)
 quel est l'âge actuel du perroquet ? Le programme doit afficher:

	"Le_perroquet_du_capitaine_a_actuellement_ZZ_ans.

<u>Information</u> : une petite remarque sur "print"

	print("(",3,")") # affiche ( 3 ) la virgule ajoute un espace.
	print("(%d)",3) # affiche (3) aucun espace.   
	a=3
	print(f"({a})") # affiche (3)   

==

before==

import random 
X,x= random.choice([("deux",2),("trois",3),("quatre",4) ,("cinq",5)])
Y,y= random.choice([("deux",2),("trois",3),("quatre",4),("cinq",5)])
Z,z= random.choice([("la moitié",2),("le tiers",3),("le quart",4)])

import jinja2
soluce= jinja2.Template(soluce).render(globals())
code=  jinja2.Template(code).render(globals())
==

plsoluce==
Test 1 |33
Test 2 |66
Test 4 |100000
==










