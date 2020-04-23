#!/usr/bin/env python3
# coding: utf-8

# ****************************************************************************
#    Copyright (C) 2020 Nicolas Borie <nicolas.borie at univ-eiffel dot fr>
#
#           Distributed under the terms of the CC-BY-SA 4.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#    The full text of the CC-BY-SA 4.0 is available at:
#
#          https://creativecommons.org/licenses/by-sa/4.0/legalcode
# ****************************************************************************

# CYOA : Choose Your Own Adventure (Gamebook)

# This builder mainly parse the python game_data_file...

import sys, json, jsonpickle
import random
from components import RadioGroup

def ParseGameData(file_data):
    r"""
    The incredible CYOA parseur...

    The file should contain a python dictionary as follows:

    {
    # L'étape 0 n'existera jamais, le template commencera de manière harcodé à l'étape '1'    
    
    # '0' :
    #     [
    #         'code python qui sera eval(...) à chaque entrée sur cette
    #         étape 0',
    #         "Texte de l'étape qui sera affiché à l'ecran et contextuelle
    #         de la situation de l'histoire, de l'exercice",
    #         [
    #             ['X', "texte du lien pour aller vers l'étape X"],
    #             ['Y', "texte du lien pour aller vers l'étape Y"]
    #         ]
    #     ],
    }
    """
    return eval(file_data.read())

if __name__ == "__main__":
    """
    This programm generate a nice Multiple Choice formulary from the context 
    exercice. The MCQ is mainly build from a file specified by key 
    `data_from_file` inside the exercise.
    """
    with open(sys.argv[1],'r') as f:
        context = json.load(f)

    # Here is the name of the file containing all story steps
    file_data_name = context['game_data_file']
        
    if file_data_name == "None":
        context['text'] = ("This exercice does not use the CYOA template correctly. "
        "A game_data_file should have been provided when inheriting from the CYOA "
        "template. After, this text shoud no more appear.")
        sys.exit(1)
    
    # The parsing is done here
    with open(file_data_name, "r") as file_data :
        game_data = ParseGameData(file_data)
    context['game_data'] = game_data

    # This is HARCODED : the first step must have for key the srting '1'
    context['nb_total_step'] = 1
    context['current_step'] = "1"
    code_init = compile(context['game_data']['1'][0], "init", "exec")
    exec(code_init, context, context)

    context['text'] = str(context['game_data']['1'][1])
    context['form'] = ' {{ group|component }} '
    context['group'] =  RadioGroup( items=[] )
    context['group'].items = []
    for step_to in context['game_data']['1'][2]:
        index_step_to = step_to[0]
        text_step_to = step_to[1]
        context['group'].items.append({ "id" : index_step_to, "content" : text_step_to })

    with open(sys.argv[2], 'w+') as f:
        f.write(jsonpickle.encode(context if context else get_context(), unpicklable=False))
        
    sys.exit(0)








