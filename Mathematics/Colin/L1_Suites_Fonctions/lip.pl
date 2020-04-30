

title= Des fonctions Lipschitziennes
tag= Lipschitz|function|math|continuity 


# ce code permet d'ajouter des qestions 
buildquestions==
import random
questions=""
for toto in range(2):
    a=random.randint(4,15)
    b=random.randint(-18,3)
    while b==a:
        b=random.randint(-5,5)
    a2=a//random.randint(1,5)
    f=f"{a}x{b}" if b<0 else f"{a}x+{b}"
    questions += f"""
* Soit la fonction $%x  \mapsto  {f}%$ dites si 
+ est {a}-Lipschitzienne 
- est {b}-Lipschitzienne 
- est k-Lipschitzienne pour tout k
- est {a2}-Lipschitzienne
- n'est pas Lipschitzienne
"""

for _ in range(3):
    a=random.randint(1,5)
    b=random.randint(-5,5)
    a2=a//random.randint(1,5)
    f=f"{a}x^2{b}" if b<0 else f"{a}x^2+{b}"
    questions += f"""
* Soit la fonction $%x  \mapsto  {f}%$ dites si 
- est {a}-Lipschitzienne 
- est {b}-Lipschitzienne 
- est k-Lipschitzienne pour tout k
+ est Lipschitzienne sur l'interval ]-1,1[
"""




==

extends=/model/AMC_TXT.pl

