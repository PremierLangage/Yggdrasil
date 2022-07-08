extends= /AAAA/Gaudet/template/cgbasic.pl

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 
lexemple =@exemple

#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]


title= Diagnostique Binaire

text==

{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est pour la question 1 1636725
et  pour la question 2.

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

def Question1(): 
    array = [x.split(' ') for x in sys.stdin.readlines()]
    position = [0,0]
    for input in array:
        if input[0] == "avant":
            position[0] += int(input[1])
        elif input[0] == "haut":
            position[1] -= int(input[1])
        elif input[0] == "bas":
            position[1] += int(input[1])
    return position[0] * position[1]

if __name__ == '__main__':
    print(Question1())  

import sys

def Question2(): 
    array = [x.split(' ') for x in sys.stdin.readlines()]
    aim = 0
    position = [0,0]
    for input in array:
        if input[0] == "avant":
            position[0] += int(input[1])
            position[1] += (int(input[1]) * aim)
        elif input[0] == "haut":
            aim -= int(input[1])
        elif input[0] == "bas":
            aim += int(input[1])
    return position[0] * position[1]

if __name__ == '__main__':
    print(Question2())  
  
==