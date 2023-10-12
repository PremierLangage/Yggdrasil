extends= /AAAA/Gaudet/template/cgbasic.pl

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 
lexemple =@exemple

#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]


title= Lanterne

text==

{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est 4160394 pour la question 359999 
et 1631647919273 pour la question 2.

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
from itertools import zip_longest

def simulate_days(days, ages):
    for day in range(1, days+1):
        new_fish = ages.count(0)
        ages = [a-1 if a>0 else 6 for a in ages]
        ages += [8] * new_fish
    return(len(ages))

def Question1():
    array = [x for x in sys.stdin.readlines()]
    ages = []
    for x in array[0].split(','):
        if (x != ''):
            ages.append(int(x))
    res = simulate_days(80, ages)
    return res

if __name__ == '__main__':
    print(Question1())  




import sys
import random
import re
from itertools import zip_longest

def simulate_days2(days, fish_at_stage):
    for day in range(1, days+1):
        expired_fish = fish_at_stage.pop(0)
        fish_at_stage[6] += expired_fish
        fish_at_stage.append(expired_fish)
    return sum(fish_at_stage)

def Question2():
    array = [x for x in sys.stdin.readlines()]
    ages = []
    for x in array[0].split(','):
        if (x != ''):
            ages.append(int(x))
    fish_at_stage = [ages.count(i) for i in range(9)]
    res = simulate_days2(256, fish_at_stage)
    return res

if __name__ == '__main__':
    print(Question2())  
  
==