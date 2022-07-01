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

    def Question1() :
        lignes  = sys.stdin.readlines()
        ...

==



before==
import build

data = build.builddata()
q1done = False
with open("ennonce1.md","r") as f:
    lenonce= f.read()

testcases, donnees = build.buildQ1(lexemple)

if q1done : 

    with open("ennonce2.md","r") as f:
        lenonce += f.read()
==


editor.code ==
import sys
def Question1():
    array = [int(x[:-1]) for x in sys.stdin.readlines()]
    for i in range(len(array)):
            for j in range(i+1,len(array)):
                if array[i] + array[j] == 2020:
                    return array[i] * array[j]

def Question2():
    array = [int(x[:-1]) for x in sys.stdin.readlines()]
    for i in range( 0,len(array)-2): 
        for j in range(i + 1, len(array)-1): 
            for k in range(j + 1, len(array)):
                if array[i] + array[j] + array[k] == 2020:
                    return array[i] * array[j] * array[k]    
                    

if __name__ == '__main__':
    print(Question1())  

  
==