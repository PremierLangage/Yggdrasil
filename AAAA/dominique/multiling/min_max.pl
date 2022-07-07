
extends= /AAAA/Gaudet/template/cgbasic.pl

author=DR
title=Test avec stdin dans un fichier

tag=function

objectif=le Maximum

text==
Ecrire un programme qui prend une liste d'entiers séparés par des retours à la ligne et qui affiche { objectif }.

==


before==
import random 
# creation du fichier & calcul du resulat 
filename="data"

with open(filename, "w") as f:
    for i in range(100):
        print(random.randint(-100,1000))

# Creation d'un testcase 
testcase = f"""[('{filename}','{resulat}','Test1')]"""



==