



author= DR


tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


title= Données ça monte et cela descend

@ data [data.txt]

text==

Vous avez un fichier de données "data".

le nombre d'augmentations est le nomrbe de fois l'entier sur la ligne a été plus grand que le précédent. 

ecrire une fonction "mesure" qui retourne un tuple avec le nombre de ligne et d'augmentations.

exemple:
200 (première valeur )  
210 (augmentation)  
215 (augmentation)  
207 (diminution)  
214 (augmentation)  
216 (augmentation)  
213 (diminution)  

7 lignes  
4 augmentations   

==


before==
import random 
start= 200
augment=0
with open("data.txt","w") as f:
    for i in range(1999):
        print(start,file=f)
        if random.randint(1,10) ==1:
            start -= random.randint(10,20)
        else:
            start += random.randint(1,10)
            augment += 1
    print(start, file=f)

def mesure():
    lines=1
    augmentatins=0
    with open("data.txt","r") as f:
        j=int(f.readline().strip())
        k=int(f.readline().strip())
        l=int(f.readline().strip())
        prev= j+k+l
        for line in f.readlines():
            lines+=1
            j,k,l=k,l,int(line.strip())
            n = j+k+l
            if prev < n:
                augmentatins += 1
            prev=n
    return lines,augmentatins


pltest=f"""
>>> mesure()
(2000, {mesure()})
"""
==

editor.code==

def mesure():
    lines=1
    augmentatins=0
    with open("data.txt","r") as f:
        i=int(f.readline().strip())
        for line in f.readlines():
            lines+=1
            j=int(line.strip())
            if j>i:
                augmentatins += 1
            i = j
    return lines,augmentatins

==
