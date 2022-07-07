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

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est 1154 pour la question 1 
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
def Question1():
    array = [int(x) for x in sys.stdin.readlines()]
    gamma = ""
    countOnes: int
    for i in range(len(array[0])):
        countOnes = 0
        for num in nums:
            if num[i] == '1':
                countOnes += 1
        if countOnes >= nums.len div 2:
            gamma += '1'
        else:
            gamma += '0'
    intgamma = int(gamma, 2)
    epsilon = 2^len(nums[0]) - intgamma
    return intgamma * epsilon
    
if __name__ == '__main__':
    print(Question1())  

def Question2():
    array = [int(x) for x in sys.stdin.readlines()]
    isIncreased = 0
    for i in range(3, len(array)):
        a = array[i - 3] + array[i - 2] + array[i - 1]
        b = array[i - 2] + array[i - 1] + array[i]
        if a < b:
            isIncreased += 1
    return isIncreased
                    

if __name__ == '__main__':
    print(Question2())  
    
  
==