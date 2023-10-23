
extends=/ComputerScience/python/AP1-2122/template/pltest2023.pl

@ /builder/bbefore.py [builder.py]

title = 
text = 

before==
import random
nombres=[0,"un","deux","trois","quatre","cinq","six","sept","huit","neuf","dix","onze","douze"]
nb1= random.randint(2,13)
tx1 = nombres[nb1]
nb2=nb1
while nb1==nb2:
    nb2 = random.randint(2,12)
    tx2= nombres[nb2]
if nb1 % nb2 == 0 :
    nb1,nb2= nb2,nb1
    tx1, tx2 = tx2 , tx1

title = f"Divisible par {tx1} mais pas par {tx2}."

text=f"""  

Programmer une fonction **oui_mais(n)** qui teste si un entier n est divisible par {tx1} mais pas par {tx2}. <br>
"""
val = 17
pltest= f"""
>>> oui_mais({val}) == (({val} % {nb1} ==0) and ({val} % {nb2} != 0))# Facile
True
"""
for i in range(4):
    val = random.randint(3,700)
    globals()[f"pltest{i}"]=f"""
>>> oui_mais({val}) == (({val} % {nb1} ==0) and ({val} % {nb2} != 0))# Facile
True
"""

code += f"""def oui_mais(n):\n return ((17 % n ==0) and (17 % n != 0))\n"""





==

code==

# du cod entier
def oui_mais(n):\n return ((17 % n ==0) and (17 % n != 0))\n

==







