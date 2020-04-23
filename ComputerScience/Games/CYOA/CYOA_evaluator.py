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

from sandboxio import output, get_context, get_answers
from components import RadioGroup

if __name__ == "__main__":
    context = get_context()
    answers = get_answers()

    # Detect if the game is ended...
    if ('is_ended' in context) and (context['is_ended']):
        context['text'] = "<span style='color:red'><b>C'est fini, actualiser la page pour recommencer une nouvelle partie.</b></span><br />" + context['text']
        output(-1, " ", context)

    # Detect if the user properly fill the form
    if (not isinstance(context['group'].selection, str)) or (len(context['group'].selection) == 0):
        context['text'] += "<span style='color:red'><b>Veuillez selectionner une des alternatives avant de valider !!</b></span><br /> "
        output(-1, " ", context)

    # Thus one more step...
    context['nb_total_step'] += 1

    # Apply action inside the link
    for step_to in context['game_data'][context['current_step']][2]:
        if step_to[0] == context['group'].selection:
            if len(step_to) > 2:
                code_link = compile(step_to[2], "link_code", "exec")
                exec(code_link, context, context)

    # Apply action of the current step
    context['grade'] = None
    code_step = compile(context['game_data'][context['group'].selection][0], "link_step", "exec")
    exec(code_step, context, context)

    context['current_step'] = context['group'].selection
    context['text'] = str(context['game_data'][context['current_step']][1])
    context['form'] = ' {{ group|component }} '
    context['group'] =  RadioGroup( items=[] )
    context['group'].items = []
    for step_to in context['game_data'][context['current_step']][2]:
        index_step_to = step_to[0]
        text_step_to = step_to[1]
        if ('disallow' not in context) or (index_step_to not in context['disallow']):
            context['group'].items.append({ "id" : index_step_to, "content" : text_step_to })

    if context['group'].items == []:
        context['is_ended'] = True

    if context['grade'] is not None:
        grade = int(context['grade'])
        output(grade, " ", context)

    output(-1, " ", context)




