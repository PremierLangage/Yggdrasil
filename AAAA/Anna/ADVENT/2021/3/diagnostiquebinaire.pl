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

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est 4160394 pour la question 1 
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

==



solution ==
import sys
from itertools import zip_longest

def Question1():
    array = [x[:-1] for x in sys.stdin.readlines()]
    polarity = []
    for string in array:
        polarity = [
            s + (1 if x == '1' else -1)
            for s, x in zip_longest(polarity, string, fillvalue=0)
        ]
    gamma = sum([2**i for i, x in enumerate(reversed(polarity)) if x > 0])
    epsilon = sum([2**i for i, x in enumerate(reversed(polarity)) if x < 0])
    return gamma * epsilon
    
if __name__ == '__main__':
    print(Question1())  

def Question2():
    array = [x for x in sys.stdin.readlines()]
    i = 0
    while True:
        polarity = []
        for string in array[i]:
            polarity = [
                s + (1 if x == '1' else -1)
                for s, x in zip_longest(polarity, string, fillvalue=0)
            ]
        j = len(array) - 1
        for value in reversed(array):
            if value[i] != v: array.pop(j)
            if len(array) == 1: return int(v[0], 2)
            j -= 1
        i += 1
    oxygen= getRating(lambda c: '1' if c >= 0 else '0', array.copy())
    co2 = getRating(lambda c: '0' if c >= 0 else '1', array.copy())
    return oxygen * co2
                    

if __name__ == '__main__':
    print(Question2())  
    
  
==