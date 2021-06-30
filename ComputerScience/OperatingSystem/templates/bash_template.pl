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

@ utils_bash.py
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = shell
editor.height = 80px

editor.code ==
# entrez votre code shell ici...

==

#! linter:require:expected_stdout::string
#! linter:require:title::string
#! linter:require:before

nb_attempt=0
best_grade = 0

before==
==

title=bash code template (titre à surcharger!)

text==
==

form==#|markdown|
{{ editor|component }}

<input id="form_user_hack" name="form_user_hack" type="hidden" value="{{ user }}">

==

evaluator==#|python|
import subprocess
from utils_bash import display_as_shell_this, frame_message

# some initialisations
feedback = f"    "
form = "{{ editor|component }}"
form += '<input id="form_user_hack" name="form_user_hack" type="hidden" value="{{ user }}">'

# Forbid the use of redirection in file
if ">" in editor.code:
    feedback = "Dû à des limilitations techniques, une commande ne peut pas contenir de caractère chevron droit. Notament les redirections en sortie ne sont pas autorisées. L'exerice reste faisable avec cette limitation. Merci de modifier votre commande."
    grade = (-1, frame_message(feedback, "warning"))

# Here we choose to execute the set of commands inside a script
else:
    # Placed in a script, it allows the user to propose severals commands without /
    f = open("student_script.sh", "w")
    f.write(editor.code)
    f.close()

    sp = subprocess.run(["/bin/bash", "student_script.sh"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=7)
    spout = sp.stdout.decode()
    errout = sp.stderr.decode()
    returncode = sp.returncode

    form += display_as_shell_this(editor.code, spout, str(response["user_hack"]), errout, returncode)

    if not nb_attempt:
        nb_attempt = 1
    else:
        nb_attempt = int(nb_attempt) + 1

    best_grade = int(best_grade) if best_grade else 0
    note_eff = 50 + (200 // (3+nb_attempt))

    tent_rmrq = str(nb_attempt) + " Tentative"
    if nb_attempt > 1:
        tent_rmrq = str(nb_attempt) + " Tentatives"

    if expected_stdout == spout:
        grade_now = 100
    else:
        grade_now = 0

    note_finale = (note_eff * grade_now) // 100
    best_grade = max([note_finale, best_grade])

    feedback_note = "<br><u>Note finale :</u> <b>"+str(best_grade)+"%</b> <i>(Toutes propositions confondues)</i><br>"
    feedback_note += "Note pour cette tentative : "+str(note_finale)+"% <br>"
    feedback_note += "Partie tests : "+str(grade_now)+"% <br>"
    feedback_note += "Partie efficacit&eacute; : "+str(note_eff)+"% ("+tent_rmrq+")<br><br>"

    if expected_stdout == spout:
        feedback = "Bravo, votre code fait le travail !"
        grade = (note_finale, frame_message(feedback, "ok") + feedback_note)
    else:
        feedback = "Désolé, votre code ne produit pas le résultat attendu. Modifiez votre commande."
        grade = (note_finale, frame_message(feedback, "error") + feedback_note)

==


