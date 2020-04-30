

title=Des fonctions Lipschitziennes
tag= Lipschitz|function|math|continuity 

extends=/model/AMC_TXT.pl

# ce code permet d'ajouter des qestions 
buildquestions==
import random

questions =""
for _ in range(5):
    a=random.randint(1,5)
    b=random.randint(-5,5)
    a2=a//random.randint(1,5)
    questions += f"""

* Soit la fonction $%{{ f }}%$ dites si 
+ est {{ a }}-Lipschitzienne 
- est {{ b }}-Lipschitzienne 
- est k-Lipschitzienne pour tout k
- est {{ a2 }} 
    """

==

extends=/model/AMC_TXT.pl



