
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
    def grade(nb_success : int, nb_fail_timeout : int, nb_fail_stdout : int, nb_fail_stderr : int, nb_fail_exit_code : int):
        nb_tests = nb_success + nb_fail_timeout + nb_fail_stdout + nb_fail_stderr + nb_fail_exit_code
        return round(100 * nb_success / nb_tests)
    ==

    Pour les plus experts la balise grade permet de rensigner une fonction python `grade`
    qui va générer la note de l'élève. Notez que l'exemple si dessus est la fonction utilisée par défaut.

==

@ /ComputerScience/python/AP1-1920/templates/utils/feedback2.py
@ /ComputerScience/python/AP1-1920/templates/utils/template.html
@ /utils/sandboxio.py
builder =@ /builder/before.py
grader  =@ /grader/evaluator.py

settings.requirements=title,text,soluce

editor =: CodeEditor
editor.theme = dark
editor.language = r

form = {{editor|component}}

before==#|python|
attemps = 0

==

evaluator==#|python|
from feedback2 import FeedBack
from subprocess import TimeoutExpired, run 

attemps += 1

nb_success = 0
nb_fail_timeout = 0
nb_fail_stdout = 0
nb_fail_stderr = 0
nb_fail_exit_code = 0

feedback = FeedBack()

def concatenate_code_to_file(code_to_execute : str, file : str):
    code = f"{code_before}\n{code_to_execute}\n{code_after}"
    with open(file, 'w') as f:
        f.write(code)


def split_name_inputs(name_inputs : str) -> tuple:



    splited = name_inputs.splitlines()
    name = splited[0]
    inputs = ""
    if len(splited) > 1:
        inputs = "\n".join(splited[1:] + ["\n"])
    return name, inputs


def run_script(script : str, inputs : str, flags : list = ["--vanilla"], timeout : int = 4):
    process_timeout = False
    try:
        process = run(['Rscript', script] + flags, input=inputs, capture_output=True, timeout=timeout, text=True)
        print(process)
    except TimeoutExpired as e:
        process_timeout = True
    finally:
        stdout = process.stdout
        stderr = process.stderr
        exit_code = process.returncode
    if not stdout.endswith("\n"):
        stdout += "\n"
    return stdout, stderr, exit_code, process_timeout

def run_test(test : str, timeout : int = 4, feedback : FeedBack = FeedBack(), nb_success = 0, nb_fail_timeout= 0, nb_fail_stdout= 0, nb_fail_stderr= 0, nb_fail_exit_code= 0):
    name, inputs = split_name_inputs(test)

    concatenate_code_to_file(editor.code, "student.R")
    student_stdout, student_stderr, student_exit_code, student_timeout = run_script("student.R", inputs, timeout=timeout)
    if not compare_exit_code and student_exit_code :
        feedback.addTestFailure(name, f"Code de sortie différent de 0 :\n{student_stderr}", "")
        return
    
    concatenate_code_to_file(soluce, "teacher.R")
    teacher_stdout, teacher_stderr, teacher_exit_code, teacher_timeout = run_script("teacher.R", inputs, timeout=timeout)


    if teacher_timeout and student_timeout:
        if not ignore_teacher_timeout:
            feedback.addGlobalFeedback("Attention, le code du professeur a dépassé le temps limite. Il est possible \
                                       que ce soit une erreur. \nSi vous êtes sûr de votre code, vous pouvez ignorer cette\
                                        erreur en définissant la variable ignore_teacher_timeout à True.\n")
        nb_success += 1
        feedback.addTestSuccess(name, "Error : timeout", "Error : timeout")
    elif student_timeout:
        nb_fail_timeout += 1
        feedback.addTestFailure(name, "Error : timeout", teacher_stdout)
    elif teacher_stdout != student_stdout\
            or (compare_stderr and teacher_stderr != student_stderr)\
            or (compare_exit_code and teacher_exit_code != student_exit_code):
        if teacher_exit_code != student_exit_code : 
            nb_fail_exit_code += 1
        elif teacher_stderr != student_stderr : 
            nb_fail_stderr += 1
        else : 
            nb_fail_stdout += 1
        feedback.addTestFailure(name, f"exit code: {student_exit_code}\n\nstdout:\n{student_stdout}\n\nstderr:\n{student_stderr}",
                                f"exit code: {teacher_exit_code}\n\nstdout:\n{teacher_stdout}\n\nstderr:\n{teacher_stderr}") 
    else:
        nb_success += 1
        feedback.addTestSuccess(name, f"exit code: {student_exit_code}\n\nstdout:\n{student_stdout}\n\nstderr:\n{student_stderr}",
                                f"exit code: {teacher_exit_code}\n\nstdout:\n{teacher_stdout}\n\nstderr:\n{teacher_stderr}")


tags = [i for i in globals() if i.startswith('test_')]
for tag in tags:
    if f"timeout_{tag.removeprefix('test_')}" in globals():
        timeout = globals()[f"timeout_{tag.removeprefix('test_')}"]
    else: timeout = 4
    run_test(globals()[tag], timeout, feedback, nb_success, nb_fail_timeout, nb_fail_stdout, nb_fail_stderr, nb_fail_exit_code)
if len(tags) == 0:
    run_test("Test par défaut", 4, feedback, nb_success, nb_fail_timeout, nb_fail_stdout, nb_fail_stderr, nb_fail_exit_code)

def default_grade(nb_success, nb_fail_timeout, nb_fail_stdout, nb_fail_stderr, nb_fail_exit_code):
    nb_tests = nb_success + nb_fail_timeout + nb_fail_stdout + nb_fail_stderr + nb_fail_exit_code
    return round(100 * nb_success / nb_tests)

local_dic = dict()
try:
    exec(grade + f"\ng = grade({nb_success}, {nb_fail_timeout}, {nb_fail_stdout}, {nb_fail_stderr}, {nb_fail_exit_code})", None, local_dic)
except Exception as e:
    local_dic["g"] = default_grade(nb_success, nb_fail_timeout, nb_fail_stdout, nb_fail_stderr, nb_fail_exit_code)
    feedback.addGlobalFeedback("Attention, il y a une erreur dans la fonction `grade` fournie.\nLa fonction grade par défaut est donc utilisée.")


grade = (local_dic["g"], feedback.render())
==

code_before==
==

code_after==
==

compare_stderr = False
compare_exit_code = False
ignore_teacher_timeout = False
