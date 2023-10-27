
doc==
Rsoluce.pl est un modèle permettant d'executer des programmes R.

Le but de ce modèle est de prendre un code `bon` du professeur et de le comparer à celui de l'élève via 
différents tests écrits par le professeur.

Par défaut un test est considéré comme réussi si la sortie standard est la même pour le code de l'élève et celui 
de la solution, que le code d'erreur renvoyé est 0 et que le code de l'élève n'ai pas timeout. 
Ce comportement peut être modifié par les balises suivantes : 
    - compare_stderr = True
        Compare la sortie d'erreur des deux codes
    - compare_exit_code = True
        Compare le code d'erreur des deux codes

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

    Le timeout est un chiffre ou un nombre flotant compris entre 0 et 4 il sera appliqué au code
    de l'élève ainsi qu'au code du professeur.

    code_before ==

    ==

    La balise `code_before` permet de renseigner un code qui sera ajouter avant le code de l'élève ainsi que
    le code de la solution.

    code_after ==

    ==

    La balises `code_after` fait comme la balise `code_before` mais concatène à la fin de code
    de l'élève ou de la solution.

    grade==

    ==

    Pour les plus experts la balise grade permet de rensigner une fonction python `grade`
    qui va générer la note de l'élève. Notez que l'exemple si dessus est la fonction utilisée par défaut.

==

settings.requirements=title,text,soluce

evaluator==#|python|
import subprocess

with open('student.R', 'w') as f:
    f.write(editor.code)

with open('teacher.R', 'w') as f:
    f.write(soluce)

def run_test(test : str):
    splited = test.split('\n', 1)
    name = splited[0]
    inputs = ""
    if len(splited) > 1:
        inputs = splited[1:]
    
    try :
        process = subprocess.run(['Rscript', 'teacher.R'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        teacher_stdout = process.stdout
        teacher_stderr = process.stderr
        teacher_returncode = process.returncode
    except TimeoutExpired as e:
        teacher_timeout = True

    try :
        process = subprocess.run(['Rscript', 'student.R'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        student_stdout = process.stdout
        student_stderr = process.stderr
        student_returncode = process.returncode
    except TimeoutExpired as e:
        teacher_timeout = True

    return 


tags = globals()
for tag in tag if tag.startswith("test_"):
    
process = subprocess.run(['Rscript', 'hello_world.R'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
stdout = process.stdout
ce = process.returncode

ans = "ex&eacute;cution : " + stdout.decode() + "(code Unix de retour : " + str(ce) + ")"

grade = (100, ans)
==