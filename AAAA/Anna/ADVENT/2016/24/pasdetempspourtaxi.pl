extends= ../../template/advent.pl

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 
lexemple =@exemple

#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]


title= Pas le temps pour un taxi

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
    array = [x[:-1] for x in sys.stdin.readlines()]
    out = 0
    for input in array:
        ar = input.split(' ')
        if len(ar) == 3:
            lst_tmp = []
            freq, letter, password = ar[0], ar[1], ar[2]
            letter = letter[:len(letter) - 1]
            low, high = map(int, freq.split('-'))
            lst_tmp.append(low)
            lst_tmp.append(high)
            lst_tmp.append(letter)
            lst_tmp.append(password)
        count = 0
        for char in lst_tmp[3]:
            if char == lst_tmp[2] : 
                count += 1
        if int(lst_tmp[1]) >= count >= int(lst_tmp[0]):
            out += 1
    return out
    
if __name__ == '__main__':
    print(Question1())  


import sys

def Question2():
    array = [x[:-1] for x in sys.stdin.readlines()]
    out = 0
    for input in array:
        ar = input.split(' ')
        if len(ar) == 3:
            lst_tmp = []
            freq, letter, password = ar[0], ar[1], ar[2]
            letter = letter[:len(letter) - 1]
            low, high = map(int, freq.split('-'))
            lst_tmp.append(low)
            lst_tmp.append(high)
            lst_tmp.append(letter)
            lst_tmp.append(password)
        count = 0
        for char in lst_tmp[3]:
            if char == lst_tmp[2] : 
                count += 1
        if (lst_tmp[3][lst_tmp[0] - 1] == letter) ^ (lst_tmp[3][lst_tmp[1] - 1] == letter) :
            out += 1
    return out


if __name__ == '__main__':
    print(Question2())  
 
  
==
