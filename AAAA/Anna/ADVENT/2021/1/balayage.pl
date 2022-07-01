extends= /AAAA/Gaudet/template/cgbasic.pl

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 
lexemple =@exemple

#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]


title= Signaler Reparation

text==

{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est 145875 pour la question 1 
et 241861950 pour la question 2.

<details><summary>exemple</summary><blockquote>
  {{lexemple}}
</blockquote></details>

<details><summary>data</summary><blockquote>
  {{donnees}}
</blockquote></details>

Vous pouvez par exemple ecrire : 

    def Question1():
        array = [int(x[:-1]) for x in sys.stdin.readlines()]
        ...VOTRE CODE
    if __name__ == '__main__':
        print(Question1())  

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
    lenonce += f.read()

testcases, donnees = build.buildQ2(lexemple,data)
==



editor.code ==
import sys
def Question1():

def Question2():

if __name__ == '__main__':
    print(Question1())  
    
  
==