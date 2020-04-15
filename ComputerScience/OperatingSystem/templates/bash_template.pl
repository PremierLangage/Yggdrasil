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

before==

==

title=bash code template (titre à surcharger!)

text==

==

form==
{{ editor|component }}

<input id="form_user_hack" name="form_user_hack" type="hidden" value="{{ user }}">

==

evaluator==
import subprocess
from utils_bash import display_as_shell_this

f = open("student_script.sh", "w")
f.write(editor.code)
f.close()

sp = subprocess.run(["/bin/bash", "student_script.sh"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=7)
spout = sp.stdout.decode()
errout = sp.stderr.decode()
returncode = sp.returncode

form = "{{ editor|component }}"
form += '<input id="form_user_hack" name="form_user_hack" type="hidden" value="{{ user }}">'
form += display_as_shell_this(editor.code, spout, str(response["user_hack"]), errout, returncode)

grade = (100, f"    ")

==





