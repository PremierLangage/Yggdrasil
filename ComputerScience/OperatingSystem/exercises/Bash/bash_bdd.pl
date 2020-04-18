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

extends=/ComputerScience/OperatingSystem/templates/bash_template.pl

# Add the file containing the db of the "maison des jeunes et de la culture"
@ mjc.txt

author=Nicolas Borie
title=Base de données primitive en bash

editor.code=head -3 mjc.txt

before==
import random
from utils_bash import display_as_shell_this, frame_message

things = [("mine", "73\n"), ("maison", "115\n"), ("charbon", "75\n")]
(name_thing, expected_stdout) = random.choice(things)

sp = subprocess.run(["head", "-3", "mjc.txt"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=7)
spout = sp.stdout.decode()
errout = sp.stderr.decode()
returncode = sp.returncode

form += display_as_shell_this(editor.code, spout, str(response["user_hack"]), errout, returncode)
==

text==
Un fichier **mjc.txt** a été placé dans votre répertoire courant de travail
==

form==
{{ editor|component }}

<input id="form_user_hack" name="form_user_hack" type="hidden" value="{{ user }}">

==



