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

import sys
import json
import random
from utils import subset_index, knuth_mixing

def ParseQuestion(opened_file):
    """
    Parse a Python open file of formated questions in AMC style and return a 
    list of parsed questions together with theirs answers.
    """
    text = None
    goods = []
    bads = []
    current = None
    MCQ_lst = []
    # We manually add a last "*" in the parsing to register the last question 
    for line in opened_file.readlines()+["*"]:
        if line[0] in "*+-":
            # We did read a new item
            # First, we register the last item
            if current is not None:
                if current[0] == "*":
                    text = current[1:]
                elif current[0] == "+":
                    goods.append(current[1:])
                elif current[0] == "-":
                    bads.append(current[1:])
                else:
                    raise ValueError("Error during parsing the questions file.")
            
            if line[0] == "*":
                # In this case, the new item is a new question
                # It is time to insert a potential question
                if text is not None:
                    MCQ_lst.append([text, goods, bads])
                    text = None
                    goods = []
                    bads = []
            
            # the new item overwrite the current one
            current = line 
        else:
            # If this is not a new item, we concat to the previous item.
            current = current.replace("\n", " ")
            current += line
    return MCQ_lst

if __name__ == "__main__":
    """
    This programm generate a nice Multiple Choice formulary from the context 
    exercice. The MCQ is mainly build from a file specified by key 
    `data_from_file` inside the exercise.
    """
    with open(sys.argv[1],'r') as f:
        context = json.load(f)
       
    # Here is the name of the file containing all available questions
    file_question_name = context['data_from_file']
        
    if file_question_name == "None":
        context['text'] = ("Cet exercise n'utilise pas le template qcm "
        "correctement. L'entrée 'data_from_file' de l'exercice doit spécifier "
        "le chemin d'un fichier accessible contenant les questions.")
        sys.exit(1)
    
    # The parsing is done here
    with open(file_question_name, "r") as file_question :
        question_lst = ParseQuestion(file_question)
    context['mcq'] = question_lst
    
    # Set the number of questions in this MCQ
    if 'number_question' in context:
        number_of_mcq = int(context['number_question'])
        # By security, one can not have more questions than availlable.
        number_of_mcq = min(number_of_mcq, len(context['mcq']))
    else:
        # If the number of question is not given, take half of them 
        # but no more than 20.
        number_of_mcq = min(20, len(context['mcq']) // 2)
    
    # Set the text at begining of MCQ
    if number_of_mcq > 1:
        context['text'] = "Cliquez pour entammer une série de " + str(number_of_mcq) + " questions !"
    elif number_of_mcq == 1:
        context['text'] = "Cliquez pour accèder à la question !"
    else:
        context['text'] = "Aucune question n'a pu être préparée ou selectionnée : veuillez vérifier votre fichier de questions !"
    
    # Selection of the indices of the questions
    context['indices_questions'] = knuth_mixing(subset_index(len(context['mcq']), number_of_mcq))
    # A key for the grade of different questions
    context['grade_questions'] = []
    # No form before the first question just a submit to continu
    context['form'] = " "
    
    with open(sys.argv[2], 'w+') as f:
        json.dump(context, f)
        
    sys.exit(0)





