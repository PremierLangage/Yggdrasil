
doc==
Rsoluce.pl est un modèle permettant d'executer des programmes R.

Le but de ce modèle est de prendre un code `bon` du professeur et de le comparer à celui de l'élève via 
différents tests écrits par le professeur.

Les balises à définir obligatoirement : 

    title==
    Titre de l'éxercice
    ==

    text==
    Énoncé de l'éxercice
    ==

    soluce==
    Un script R répondant à l'éxercice.
    ==

Les balises optionnelles : 
    test_X==
    Nom du test
    entrée 1
    entrée 2 
    entrée 3
    ==

    Les test seront éxécutés dans l'order lexicographique. 
    Notez que les entrées sont passées au programme par l'entrée standart.
    Il peut ne pas y avoir d'entrée du tout.
    Dans le cas où aucun test n'a été défini les deux scripts seront quand même
    éxécutés et comparés sans aucune entrée.

    timeout_X= 4

    Le timeout est un chiffre compris entre 1 et 4 inclus il sera appliqué au code
    de l'élève ainsi qu'au code du professeur.

==

settings.requirements=title,text,soluce

evaluator==#|python|
import subprocess

with open('student.R', 'w') as f:
    f.write(editor.code)

with open('teacher.R', 'w') as f:
    f.write(soluce)

def run_test(test : str):
    splited = test.splitlines()
    name = splited[0]
    inputs = splited[1:]
    



tags = locals()
for tag in tag if tag.startswith("test_"):
    
process = subprocess.run(['Rscript', 'hello_world.R'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
stdout = process.stdout
ce = process.returncode

ans = "ex&eacute;cution : " + stdout.decode() + "(code Unix de retour : " + str(ce) + ")"

grade = (100, ans)
==