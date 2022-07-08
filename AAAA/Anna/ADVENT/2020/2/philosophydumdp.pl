extends= /AAAA/Gaudet/template/cgbasic.pl

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 
lexemple =@exemple

#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]


title= Philosophie du mot de passe 

text==

{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est 4160394 pour la question 1 
et 4125600 pour la question 2.

<details><summary>exemple</summary><blockquote>
  {{lexemple}}
</blockquote></details>

<details><summary>data</summary><blockquote>
  {{donnees}}
</blockquote></details>

==



before==
import build

data = build.ToList(lexemple)

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
def Q1(low, high, letter, password):
    count = 0
    for char in password:
        if char == letter:
            count += 1
    return high >= count >= low

def Question1():
    array = [x[:-1] for x in sys.stdin.readlines()]
    out = 0
    for input in array:
        count = 0
        for char in input[3]:
            if char == input[2] : 
                count += 1
        if input[1] >= count >= input[0]:
            out += 1
    return out
    
if __name__ == '__main__':
    print(Question1())  


import sys


def Q2(position1, position2, letter, password):
    return (password[position1] == letter) ^ (password[position2] == letter)

def Question2():
    array = [x[:-1] for x in sys.stdin.readlines()]
    out = 0
    for input in array:
        if Q2(input[0]-1, input[1]-1, input[2], input[3]):
            out += 1
    return out

if __name__ == '__main__':
    print(Question2())  
  
==
