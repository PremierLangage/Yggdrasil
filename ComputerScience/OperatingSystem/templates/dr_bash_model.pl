
#!/usr/bin/env python3
# coding: utf-8

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

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = shell
editor.height = 100px

editor.code ==

echo "sortie erreur " 1>&2
echo "sortie standard"
==

before==
==

title=bash code template (titre à surcharger!)

text==
==

form==
{{ editor|component }}
==

evaluator==
import subprocess
import sys
with open("student_script.sh", "w") as f:
    f.write(editor.code)


sp = subprocess.run(["/bin/bash","student_script.sh"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
spout = sp.stdout.decode()
sperr = sp.stderr.decode()
s = "<pre>" + spout.replace('\n', '<br />') + "</pre>"
s += "Sortie erreur <pre>" + sperr.replace('\n', '<br />') + "</pre>"

grade = (100, f" {s}  ")

==



