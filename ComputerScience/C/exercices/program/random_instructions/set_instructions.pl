#*****************************************************************************
#  Copyright (C) 2016 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

author=Nicolas Borie

title=Jeu d'instructions arithmétiques
tag=programme|variable|instruction|arithmétique

@ /utils/sandboxio.py
grader =@ /grader/evaluator.py

builder =@ /ComputerScience/C/exercices/program/random_instructions/code_generation.py

consistency==
def check_consistency(dic):
    return True, ""
==

nb_variables = 2
complexity = 12
instruct_complexity = 4

text==

==

inputbox =: Input
inputbox.placeholder = Votre réponse
inputbox.appearance = outline


form==
{{ inputbox | component }}
==

evaluator==#|python|

form = """
<style>
.error-state{
   padding: 10px;
   border: 2px solid red;
}
.success-state{
   padding: 10px;
   border: 2px solid green;
}
</style>
"""

if vars_values is None:
    if inputbox.value == "Erreur":
        grade = (100, '<span class="success-state">Bravo, il y a bien une instruction qui d&eacute;clanche une erreur.</span>')
    else:
        grade = (0, '<span class="error-state">Mauvaise r&eacute;ponse, une instruction va d&eacute;clancher une Erreur.</span>')
else:
    try: 
        value = int(inputbox.value)
        if value == vars_values[0]:
            grade = (100, '<span class="success-state">Bravo, vous avez trouv&eacute; la bonne valeur.</span>')
        else:
            grade = (0, '<span class="error-state">Mauvaise r&eacute;ponse, <b>a</b> aura pour valeur '+str(vars_values[0])+' apr&egrave;s ces instructions.</span>')
    except:
        grade = (0, '<span class="error-state">Mauvaise r&eacute;ponse, <b>a</b> aura pour valeur '+str(vars_values[0])+' apr&egrave;s ces instructions.</span>')

==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}

.match-list-component svg path {
    stroke-width: 4px;
}
</style>
==
