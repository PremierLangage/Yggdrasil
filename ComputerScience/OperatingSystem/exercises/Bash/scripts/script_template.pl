#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of the GNU General Public License (GPL)
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    General Public License for more details.
#
#  The full text of the GPL is available at:
#
#                  http://www.gnu.org/licenses/
#*****************************************************************************

@ /ComputerScience/OperatingSystem/templates/utils_bash.py
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = shell
editor.height = 200px

editor.code ==
#!/bin/bash

# entrez votre code shell ici...

==

#! linter:require:expected_stdout::string
#! linter:require:title::string
#! linter:require:before

before==
==

title=bash code template (titre à surcharger!)

text==
==

form==
{{ editor|component }}

<input id="form_user_hack" name="form_user_hack" type="hidden" value="{{ user }}">

==

evaluator==#|python|
import subprocess
from utils_bash import frame_message

# some initialisations
feedback = f"    "
form = "{{ editor|component }}"
form += '<input id="form_user_hack" name="form_user_hack" type="hidden" value="{{ user }}">'

# Forbid the use of redirection in file
if ">" in editor.code:
    feedback = "Dû à des limilitations techniques, une commande ne peut pas contenir de caractère chevron droit. Notament les redirections en sortie ne sont pas autorisées. L'exerice reste faisable avec cette limitation. Merci de modifier votre script."
    grade = (-1, frame_message(feedback, "warning"))

# Here we choose to execute the set of commands inside a script
else:
    # Placed in a script, it allows the user to propose severals commands without /
    f = open("student_script.sh", "w")
    f.write(editor.code)
    f.close()

    cumul_output = ""
    nb_test_ok = 0
    nb_test_fail = 0

    # making the div for terminal screen
    cumul_output += '<br /><div style="background-color: black; '
    cumul_output += 'background-image: radial-gradient(rgba(0, 150, 0, 0.75), black 120%); '
    #cumul_output += 'height: 80vh; '
    cumul_output += 'font: 1rem Inconsolata, monospace; '
    cumul_output += 'border-radius: 15px; padding: 10px;" >'
    cumul_output += '<pre><output style="color: white; text-shadow: 0 0 5px #C8C8C8;">'

    for test_unit in test_bash:
        args_test = test_unit[1]
        expected_stdout = test_unit[2]
        test_name = test_unit[0]

        command_args = ["/bin/bash", "student_script.sh"]
        if args_test != "":
            command_args += args_test.split(' ')
        
        sp = subprocess.run(command_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=7)
        spout = sp.stdout.decode()
        errout = sp.stderr.decode()
        returncode = sp.returncode

        cumul_output += str(response["user_hack"])+"@PLaTon"
        cumul_output += ":~$> ./student_script.sh " + args_test
        cumul_output += "<br />"

        if len(errout) > 0:
            cumul_output += '<span style="color: red; text-shadow: 0 0 5px #C80000;">'
            cumul_output += errout.replace('\n', ' <br />')
            cumul_output += '</span>'
        cumul_output += spout.replace('\n', ' <br />')

        if expected_stdout == spout:
            nb_test_ok += 1
        else:
            nb_test_fail += 1

        if (returncode != 0):
            break

        # Information about process termination
    if returncode == 0:
        form += "Processes exited normally"
    elif returncode > 0:
        form += "Process exited normally with code "+str(returncode)
    else:
        if -returncode in signals:
            form += "Process exited with signal ("+str(-returncode)+") "+signals[-returncode]
        else:
            form += "Process exited with signal ("+str(-returncode)+")"

    cumul_output += "</output></pre></div>"
    form += cumul_output

    final_grade = int((100*nb_test_ok) // (nb_test_ok + nb_test_fail))
    if nb_test_fail == 0:
        feedback = "Bravo, votre code fait le travail, tous les tests passent !"
        grade = (final_grade, frame_message(feedback, "ok"))
    else:
        if nb_test_fail > 1:
            feedback = "Désolé, votre code ne produit pas les résultats attendus. "+str(nb_test_fail)+" tests ont échoué."
        else:
            feedback = "Désolé, votre code ne produit pas les résultats attendus. "+str(nb_test_fail)+" test a échoué."
        grade = (final_grade, frame_message(feedback, "error"))

==


