#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

url_phot_1 =$ /ComputerScience/C/examples/barbe/Style_1.jpg
url_phot_2 =$ /ComputerScience/C/examples/barbe/Style_2.jpg
url_phot_3 =$ /ComputerScience/C/examples/barbe/Style_3.jpg
url_phot_4 =$ /ComputerScience/C/examples/barbe/Style_4.jpg
url_phot_5 =$ /ComputerScience/C/examples/barbe/Style_5.jpg

author=Nicolas Borie

tag=simple|humour|style


# GENERATE A RANDOM QUESTION
before==#|python|

==

title=Évolution des modes

text==#|markdown|
Votre enseignant ayant 30 années d'avance sur la méta. Déterminer quelle sera 
la dernière manière à la mode pour la barbe durant l'année 2056.

<br>

==

# PRESENT THE QUESTION TO THE STUDENT
form==#|markdown|

<input type="radio" id="bs1" name="form_bs" value="bs1">
<label for="other">Le style 1 : <img src="{{ url_phot_1 }}" style="width:20%" alt="le style1"/></label>
<br>
<input type="radio" id="bs2" name="form_bs" value="bs2">
<label for="other">Le style 2 : <img src="{{ url_phot_2 }}" style="width:20%" alt="le style2"/></label>
<br>
<input type="radio" id="bs3" name="form_bs" value="bs3">
<label for="other">Le style 3 : <img src="{{ url_phot_3 }}" style="width:20%" alt="le style3"/></label>
<br>
<input type="radio" id="bs4" name="form_bs" value="bs4">
<label for="other">Le style 4 : <img src="{{ url_phot_4 }}" style="width:20%" alt="le style4"/></label>
<br>
<input type="radio" id="bs5" name="form_bs" value="bs5">
<label for="other">Le style 5 : <img src="{{ url_phot_5 }}" style="width:20%" alt="le style5"/></label>

==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
feedback = '''<span class="success-state animated pulse infinite" style="padding: 10px">Mais oui, ce style est si insane!</span>'''

grade = (100, feedback)
==


