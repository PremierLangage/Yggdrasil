extends= /AAAA/Gaudet/template/cgbasic.pl

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 
lexemple =@exemple

#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]



title= Notation Syntaxique


extrajs== #|html| 
<script>
function docopy(id){

let a=document.getElementById(id);
navigator.clipboard.writeText(a.innerText);
alert('Copied du fichier: '+id+' dans le press-papier');
}
</script>
==

text==


{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous
 dont le résultat est {{ exemplesol1 }} pour la question 1 
et 1127 pour la question 2.

<div style="font-size:0.5em">
<details><summary>Fichier exemple <button onclick="docopy('exemple')">Copy exemple</button></summary><blockquote id="exemple" style="white-space: pre-line" 
>{{lexemple}}
</blockquote></details>

<details>
<summary>Fichier de données <button onclick="docopy('data')">Copy data</button></summary>
<blockquote style="white-space: pre-line" id="data">{{donnees}}
</blockquote>
</details>
</div>
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
    illegal_points = {
    ')': 3,
    ']': 57,
    '}': 1197,
    '>': 25137,
    }
    illegal_chars = []
    for input in array:
        stack = []
        for char in input:
            is_gt = char == '>' and len(stack) > 0 and stack[-1] == '<'
            is_sq = char == ']' and len(stack) > 0 and stack[-1] == '['
            is_cl = char == '}' and len(stack) > 0 and stack[-1] == '{'
            is_ci = char == ')' and len(stack) > 0 and stack[-1] == '('
            if is_gt or is_sq or is_cl or is_ci:
                stack.pop()
            elif char in ['(', '[', '{', '<']:
                stack.append(char)
            else:
                illegal_chars.append(char)
                break
    return sum([illegal_points[char] for char in illegal_chars])
    
if __name__ == '__main__':
    print(Question1())  

import sys
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
    

def Question1(array):
    isIncreased = 0
    for i in range(1, len(array)):
        if array[i] > array[i-1]:
            isIncreased += 1
    return isIncreased

def Question2(array):
    isIncreased = 0
    for i in range(3, len(array)):
        a = array[i - 3] + array[i - 2] + array[i - 1]
        b = array[i - 2] + array[i - 1] + array[i]
        if a < b:
            isIncreased += 1
    return isIncreased
==

