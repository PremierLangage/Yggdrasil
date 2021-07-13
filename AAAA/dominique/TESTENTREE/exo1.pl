


extends = /ComputerScience/python/template/soluce.pl

title= Structure de controle 

text=

before==
toto=5
trois,cinq = random.sample([3,5,7,11,13],2)
fizz,buzz = random.sample(["pim","pam","pom","avant","marie","par","contre","orga","tp1","tp2","jacques"],2)
text=f"""
Ecrire un code qui lit un entier et le place dans la variable v puis:  
- affiche { fizz } si v est divisible par { trois }.  
- affiche { buzz } si v est divisible par { cinq }.  
- affiche { fizz }{ buzz } si v est divisible par { cinq } et { trois }.   
- affiche la valeur de v sinon.  
"""
soluce= f"""
s=""
if v % { trois } == 0:
    s+= { fizz }
if v % { cinq } == 0:
    s+= { buzz }
if s=="":
    print(v)
else:
    print(s)
"""

mplsoluce0= f" Test de {trois} \n{trois}\n"
mplsoluce1= f" Test de {cinq} \n{cinq}\n"
mplsoluce2= f" Test de Produit \n{cinq * trois}\n"
mplsoluce3= f" Test de Hors \n{cinq * trois + 1}\n"




==

