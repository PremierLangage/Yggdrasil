

extends=/ComputerScience/python/template/soluce.pl

title= structure de controle 

text=

before==
import random
trois,cinq = random.sample([3,5,7,11,13],2)
bob, buzz = random.sample(["pim","pam","pom","avant","marie","par","contre","orga","tp1","tp2","jacques"],2)

text=f"""
Ecrire un code qui lit un entier et le place dans la variable v puis:  
- affiche tout les {foncteur} des entiers de 0 à v-1.


"""

code="""
v=int(input())
"""

soluce= f"""
v=int(input())
s=""
if v % {trois} == 0:
    s+= "{bob}"
if v % {cinq} == 0:
    s+= "{buzz}"
if s=="":
    print(v)
else:
    print(s)
"""
#code=soluce
mplsoluce0= f" Test de {trois} \n{trois}\n"
mplsoluce1= f" Test de {cinq} \n{cinq}\n"
mplsoluce2= f" Test de Produit \n{cinq*trois}\n"
mplsoluce3= f" Test de Hors \n{cinq*trois+1}\n"

==