extends= /AAAA/Gaudet/template/cgbasic.pl

@ /builder/before.py [builder.py]
@sol.py [build.py]
@ennonce.md
@exemple 
@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]


title= Signaler Reparation

text==

{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier exemple ci-dessous dont le résultat est : 145875

<details><summary>exemple</summary><blockquote>
  {{lexemple}}
</blockquote></details>

<details><summary>data</summary><blockquote>
  {{donnees}}
</blockquote></details>



Vous pouvez par exemple ecrire : 

    def Question1() :
        with open("data","r") as f:
            ...# votre code
            return ...               

    def Question2() :
        with open("data","r") as f:
            ...# votre code
            return ...

==

testcases = [('exemple','145875','Tst exemple question1')]

testcases==
[('fichier1', '4000', 'Test 1'),
('fichier1', '89', 'Test 2')]
==

before==
import build
pltest0,pltest1 = build.build()
with open("ennonce.md","r") as f:
    lenonce= f.read()

with open("exemple","r") as f:
    lexemple= f.read()

with open("data","r") as f:
    donnees= f.read()
==


editor.code ==
def Question1() :
    with open("data","r") as f:
        array = [int(x[:-1]) for x in f.readlines()]
    for i in range(len(array)):
            for j in range(i+1,len(array)):
                if array[i] + array[j] == 2020:
                    return array[i] * array[j]       

def Question2():
    with open("data","r") as f:
        array = [int(x[:-1]) for x in f.readlines()]
    for i in range( 0,len(array)-2): 
        for j in range(i + 1, len(array)-1): 
            for k in range(j + 1, len(array)):
                if array[i] + array[j] + array[k] == 2020:
                    return array[i] * array[j] * array[k]      
==