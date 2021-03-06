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
from components import CheckboxGroup

if __name__ == "__main__":
    context = get_context()
    
    with open(sys.argv[2]) as f:
        answers = json.load(f)
    f.close()
    
    # time to correct the last question if relevant
    if 'goods' in context:
        all_checked = {}
        for it in context['group'].items:
            all_checked[it['id']] = it['checked']
        grade = 0
        ok = 0
        not_ok = 0
        for good in context['goods']:
            if all_checked[good] == True:
                ok += 1
            else:
                not_ok += 1
                for it in context['group'].items:
                    if it['id'] == good:
                        context['cumul_feedback'][-1][1].append(it['content'])
        for bad in context['bads']:
            if all_checked[bad] == True:
                not_ok += 1
                for it in context['group'].items:
                    if it['id'] == bad:
                        context['cumul_feedback'][-1][2].append(it['content'])
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
        context['text'] += "**"+question[0]+"**"
        context['cumul_feedback'].append([question[0],[],[]])
        
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
    
        context['form'] = ' {{ group|component }} '
        context['group'] =  CheckboxGroup(
            items=[]
        )
        context['group'].items = []
        # generation of the form
        for index in indices:
            if index < len(question[1]):
                context['goods'].append(str(index))
                context['group'].items.append({ "id": str(index), "content": question[1][index] })
            else:
                context['bads'].append(str(index))
                context['group'].items.append({ "id": str(index), "content": question[2][index - len(question[1])] })
        
        output(-1, " ", context)
    
    if len(context['grade_questions']) == len(context['indices_questions']):
        grade = 0
        for g in context['grade_questions']:
            grade += g
        grade = max([0, 100 - 2*(100 - (grade // len(context['grade_questions']) ))])
        
        context['form'] = ''
        context['text'] = "C'est fini!<br />"
        feedback = "Vous avez obtenu <b>" + str(grade) + "%</b> de réussite à votre QCM."
        
        feedback += "<br /><br />"
        error_intro = "Voici les réponses qui auraient dû être entrées :<br />"
        intro_ok = False

        for q in context['cumul_feedback']:
            if (len(q[1]) + len(q[2])) > 0:
                if not intro_ok:
                    intro_ok = True
                    feedback += error_intro
                feedback += "<br/><b>"+q[0]+"</b><br />"
                for s in q[1]:
                    feedback += "<span style=\"color:darkgreen\">"+s+"</span><br />"
                for s in q[2]:
                    feedback += "<span style=\"color:darkred\"><strike>"+s+"</strike></span><br />"

        output(grade, feedback, context)
    
    output(-1, " ", context)




