extends= /AAAA/Gaudet/template/cgbasic.pl

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 
lexemple =@exemple

#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]



title= Signaler Reparation


extrajs== #|html| 
<script>
function docopy(id){

let a=document.getElementById('ex_value');
alert('Element opié '+a.innerText);
a.innerText.select();
document.execCommand('copy');
alert('Copied the text: '+id);
}
</script>
==

text==
<button onclick="docopy('ex_value')">Copy</button>


{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est 1154 pour la question 1 
et 1127 pour la question 2.

<button onclick="let a=document.getElementById("ex_value");a.content.select();document.execCommand('copy'); alert('Copied the text: ');">Copy</button>


<blockquote id="ex_value" 
style="font-size:0.5em;white-space: pre-line">
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
    array = [int(x) for x in sys.stdin.readlines()]
    isIncreased = 0
    for i in range(1, len(array)):
        if array[i] > array[i-1]:
            isIncreased += 1
    return isIncreased
    
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
    
  
==

