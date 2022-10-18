
extends=/ComputerScience/python/template/qcmtemplatewithbuilder.pl

title= 8 pommes


before==
import random
chaine= random.choice(['pomme','banana','banane','poire','ananas'])
entier= random.randint(5,8)

text=""" Qu'affiche le programme suivant :

    print(len('{}')*{})""".format(chaine,entier)

good=str(len(chaine)*entier)+"\n"+'vrai\ntrue\nright\neffectivement'
bad=chaine*entier
bad+='\n'
bad += chaine+str(entier)
bad += '\n0'
==

text= Indiquez les lignes qui sont des commentaires en python :

nb=4
nbtrues=1
uncrosedfalse=
feedback=show

