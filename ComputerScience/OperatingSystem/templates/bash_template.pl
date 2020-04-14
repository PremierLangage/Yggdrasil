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

editor.code ==

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

f = open("student_script.sh", "w")
f.write(editor.code)
f.close()

sp = subprocess.run(["./student_script.sh"], stdout=subprocess.PIPE, shell=True)
spout = sp.stdout.decode()

grade = (100, spout)
==

