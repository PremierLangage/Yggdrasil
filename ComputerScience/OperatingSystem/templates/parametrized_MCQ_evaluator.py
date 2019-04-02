#!/usr/bin/env python3
# coding: utf-8

#*****************************************************************************
#       Copyright (C) 2019 Nicolas Borie <nicolas dot borie at u-pem . fr>
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

import sys, json
import random
from sandboxio import output, get_context, get_answers
from utils import subset_index, knuth_mixing

if __name__ == "__main__":
    with open(sys.argv[1]) as f:
        context = json.load(f)
    f.close()
    
    with open(sys.argv[2]) as f:
        answers = json.load(f)
    f.close()
    
    # time to correct the last question if relevant
    if 'goods' in context:
        grade = 0
        ok = 0
        not_ok = 0
        for good in context['goods']:
            if good in answers:
                ok += 1
            else:
                not_ok += 1
        for bad in context['bads']:
            if bad in answers:
                not_ok += 1
            else:
                ok += 1
        
        grade = 100*ok // (ok+not_ok)
        context['grade_questions'].append(grade)
    
    context['text'] = ""
    context['form'] = ""
    
    # time to prepare the next question
    if len(context['grade_questions']) < len(context['indices_questions']):

        index_next_q = context['indices_questions'][ len(context['grade_questions']) ]
        question = context['mcq'][index_next_q]
        context['goods'] = []
        context['bads'] = []
        context['text'] += question[0]
        
        # Total possible option and random combination
        if 'min_option' in context:
            min_answer = int(context['min_option'])
        else:
            min_answer = 4 # This minimizes the number of option  
        if 'max_option' in context:
            max_answer = int(context['max_option'])
        else:
            max_answer = 8 # This bounds the number of option if there are more
        
        total = len(question[1]) + len(question[2])
        max_option = min(max_answer, total)
        min_option = min(min_answer, total)
        nb_option = random.randint(min_option, max_option)
        indices = knuth_mixing(subset_index(total, nb_option))
    
        # generation of the form
        for index in indices:
            if index < len(question[1]):
                context['goods'].append(str(index))
                context['form'] +='<input type="checkbox" name="c_' + \
                str(index) + '" value="' + str(index) + '" id="form_' + \
                str(index) + '">' + question[1][index] + "<br />"
            else:
                context['bads'].append(str(index))
                context['form'] +='<input type="checkbox" name="c_' + \
                str(index) + '" value="' + str(index) + '" id="form_' + \
                str(index) + '">' + \
                question[2][index - len(question[1])] + "<br />"
        
        output(-1, "", context)
    
    if len(context['grade_questions']) == len(context['indices_questions']):
        grade = 0
        for g in context['grade_questions']:
            grade += g
        grade = grade // len(context['grade_questions'])
        
        context['form'] = ''
        context['text'] = ''
        feedback = "Vous avez obtenu <b>" + str(grade) + "%</b> de réussite à votre QCM."
        
        output(grade, feedback, context)
    
    output(-1, "THAT SHOULD NEVER HAPPEN !!!!", context)

