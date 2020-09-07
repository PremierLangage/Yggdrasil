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
tag=program|variable

@ /utils/sandboxio.py
grader =@ /grader/evaluator.py

builder =@ /ComputerScience/C/exercices/program/code_generation.py

consistency==
def check_consistency(dic):
    return True, ""
==

nb_variables = 2
complexity = 8
instruct_complexity = 4

text==
{{ inputbox | component }}
==

inputbox =: Input
inputbox.placeholder = Answer
inputbox.appearance = outline


form==
{{ inputbox | component }}
==

evaluator==#|python|
if vars_values is None:
    if inputbox.value == "Erreur":
        grade = (100, '<span class="success-state">Bravo, il y a bien une instruction qui déclanche une erreur.</span>')
    else:
        grade = (0, '<span class="error-state">Mauvaise réponse, une instruction va déclancher une Erreur.</span>')
else:
    try: 
        value = int(inputbox.value)
        if value == vars_values[0]:
            grade = (100, '<span class="success-state">Bravo, vous avez trouvé la bonne valeur.</span>')
        else:
            grade = (100, '<span class="success-state">Mauvaise réponse, **a** aura pour valeur '+str(dic['vars_values'][0])+' après ces instructions.</span>')
    except:
        grade = (0, '<span class="error-state">Mauvaise réponse, vous n\'avez pas rentré un entier valide.</span>')

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
