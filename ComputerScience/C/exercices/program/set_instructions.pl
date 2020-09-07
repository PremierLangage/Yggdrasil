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

grader== #|python|
from sandboxio import output, get_context, get_answers

def evaluator(response, dic):
    if dic['vars_values'] is None:
        if response['answer'] == "Erreur":
            return True, "Bravo"
        else:
            return False, "Mauvaise réponse"
    try: 
        value = int(response['answer'])
    except:
        return False, "Mauvaise réponse"
    if value == dic['vars_values'][0]:
        return True, "Bravo"
    else:
        return False, "Mauvaise réponse"
==




