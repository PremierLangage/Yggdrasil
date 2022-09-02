extends= /AAAA/Gaudet/template/cgbasic.pl

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 
lexemple =@exemple

#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]


title= Trahison baleine

text==

{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est 4160394 pour la question 336721 
et 91638945 pour la question 2.

<details><summary>exemple</summary><blockquote>
  {{lexemple}}
</blockquote></details>

<details><summary>data</summary><blockquote>
  {{donnees}}
</blockquote></details>

==



before==
import build

data = build.builddata()

with open("ennonce1.md","r") as f:
    lenonce= f.read()

testcases, donnees = build.buildQ1(lexemple,data)
changeText = False
==

postevaluator==
import build

changeText = True
with open("ennonce2.md","r") as f:
    lenonce = f.read()

testcases, donnees = build.buildQ2(lexemple,data)
==



solution ==
import sys
import random
import re
import numpy as np
from itertools import zip_longest

def builddata():
    tab = []
    for x in range(1500):
        val = random.randint(0, 1500)
        tab.append(val)
    return tab

def ToList(filec):
    return [int(x) for x in filec.split(",")] 
    
def calculate_fuel(positions):
    min_pos = -1
    min_fuel = np.infty
    for pos in range(min(positions), max(positions)+1):
        fuel_needed = (np.abs(positions - pos)).sum()
        if fuel_needed < min_fuel:
            min_fuel = fuel_needed
            min_pos = pos
    return  min_fuel

def Question1():
    array = [x for x in sys.stdin.readlines()]
    positions = []
    for x in array[0].split(','):
        if (x != ''):
            positions.append(int(x))
    return calculate_fuel(np.array(positions))

if __name__ == '__main__':
    print(Question1())  





import sys
import random
import re
import numpy as np
from itertools import zip_longest

def builddata():
    tab = []
    for x in range(1500):
        val = random.randint(0, 1500)
        tab.append(val)
    return tab

def ToList(filec):
    return [int(x) for x in filec.split(",")] 

def calculate_fuel2(positions):
    min_pos = -1
    min_fuel = np.infty
    for pos in range(min(positions), max(positions)+1):
        distances = (np.abs(positions - pos))
        fuel_needed = sum([(n*(n+1))/2 for n in distances])
        if fuel_needed < min_fuel:
            min_fuel = fuel_needed
            min_pos = pos
    return min_fuel

def Question2():
    array = [x for x in sys.stdin.readlines()]
    positions = []
    for x in array[0].split(','):
        if (x != ''):
            positions.append(int(x))
    return calculate_fuel2(np.array(positions))

if __name__ == '__main__':
    print(Question2())  
  
==