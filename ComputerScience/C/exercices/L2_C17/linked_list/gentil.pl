

extends= /ComputerScience/C/template/std_progC17_clang.pl

@ gentil.py



title = Des histoires de mots

text==
# Mots Méchants Mots Gentils.

Le Père Noël a besoin d'aide pour déterminer quelles chaînes de son fichier texte sont méchantes ou gentilles.

Une chaîne gentille est une chaîne avec toutes les propriétés suivantes :

     Il contient au moins trois voyelles (aeiou uniquement), comme aei, xazegov ou aeiouaeiouaeiou.
     Il contient au moins une lettre qui apparait deux fois de suite, comme xx, abcdde (dd) ou aabbccdd (aa, bb, cc ou dd).
     Il ne contient pas les chaînes ab, cd, pq ou xy, même si elles font partie de l'une des autres exigences.

Par example:

     ugknbfddgicrmopn est agréable car il a au moins trois voyelles (u...i...o...), une lettre double (...dd...), et aucune des sous-chaînes interdites.
     aaa est agréable car il a au moins trois voyelles et une lettre double, même si les lettres utilisées par différentes règles se chevauchent.
     jchzalrnumimmnmhp est méchant car il n`a pas de double lettre.
     haegwjzuvuyypxyu est méchant car il contient la chaîne xy.
     dvszwmarrgswjxmb est méchant car il ne contient qu`une seule voyelle. 

Ecrire une fonction question1(char *filename) qui lit dans le fichier filename et
 compte et retourne le nombre de chaines (une par ligne dans le fichier) gentilles.


Le fichier "exemple" que vous pouvez copier si dessous contient 1000 chaines et le nombre de mots gentils est 253.





<div style="font-size:0.5em">
<details><summary>Fichier exemple <button onclick="docopy('exemple')">Copy exemple</button></summary><blockquote id="exemple" style="white-space: pre-line" 
>{{lexemple}}
</blockquote></details>

==


#@ gentil.test [exemple]
lexemple=@gentil.test


before==

# produire le fichier data 
import gentil

gentil.buildfile("data")
# calculer la solution pour ce fichier data
sol1 = gentil.Question1()
sol2 = gentil.Question2()

# crer un fichier 
with open("sol1.c","w") as f:
    f.write("""
    int solution(char *name){ 
    if (strcmp(name,"error") == 0 ) 
    return""")
    f.write(str(sol1))
    f.write(""";
    else return 253; 
    }""")

solution= """
    int solution(char *name){ 
    if (strcmp(name,"error") == 0 ) 
    return"""+str(sol1)+"""; else return 253; }"""

import subprocess 

def makeO(filename):
    """
    compile the source in argument and return 
    """
    command_args = ["clang", filename, "-c"] 
    sp = subprocess.run(command_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    spout = sp.stdout.decode()
    errout = sp.stderr.decode()
    returncode = sp.returncode
    return (returncode, spout, errout)

c= makeO("sol1.c")
if not c[0]:
    import sys
    print(c,file=sys.stderr)

# compilation et création du fichier sol1.o
# effasser le fichier sol1.c 
import os
os.remove("sol1.c")

# attention il faut ajouter sol1.o dans les "flags" de compilation du C 
 
# même chose pour le deuxième exercice avec sol2
==



code_before==

==

form= {{ editor | component }}


editor.code==
int Question1(){
// votre code 

}
==

code_after==
int main(){

printf("J'appel votre fonction : Question1() \n");
int rep =Question1();
int sol= solution()
if (rep > sol) printf(" Votre réponse est trop grande \n");
else if (rep < sol) printf(" Votre réponse est trop grande \n");
else printf("Bravo bonne réponse\n);

}
==