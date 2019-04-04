#!/usr/bin/env python3
# coding: utf-8

import sys
import json
import random

class Question():
    """
    A class to model the notion of questions with multiple choice.
    """
    def __init__(self, text, goods, bads):
        """
        Initialize a question with its `text` : the question, with a list of 
        good answers `goods` together with a list of bad answers `bads`.
        
        `text` is supposed to be a Python string.
        `goods` is supposed to be a list of Python strings.
        `bads` is supposed to be a list of Python strings.
        """
        self._text = text
        if goods is not None:
            self._goods = goods
        else:
            self._goods = []
        if bads is not None:
            self._bads = bads
        else:
            self._bads = []
        
    def __str__(self):
        """
        Returns a string describing `self` : i.e. a question.
        """
        return "A question with mutiple possible choice"


def ParseQuestion(open_file):
    """
    Parse a Python open file of formated questions in AMC style and return a 
    list of instance of class Question.
    """
    text = None
    goods = []
    bads = []
    current = None
    MCQ_lst = []
    # We manually add a last "*" in the parsing to register the last question 
    for line in open_file.readlines()+["*"]:
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
                    MCQ_lst.append(Question(text, goods, bads))
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


def subset_index(n, p):
    """
    Returns a random subset of {0, ..., `n-1`} of size `p`
    """
    lst = []
    while (n >= p and p > 0):
        if random.randint(1, n) <= p:
            lst.append(n-1)
            p = p-1
        n = n-1
    return lst


def knuth_mixing(lst):
    """
    Mix in place element of the list `lst` in argument.
    """
    for i in range(len(lst)-1, 0, -1):
        j = random.randint(0, i)
        if j != i:
            lst[i], lst[j] = lst[j], lst[i]
    return lst


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
    file_question = open(file_question_name, "r")
    question_lst = ParseQuestion(file_question)
    
    # Time to select the question
    if 'question_index' in context:
        index = int(context['question_index'])
        if index < 0 or index >= len(question_lst):
            context['text'] = ("Cet exercice solicite une question dont via "
            "un index qui ne correspond à aucune entrée dans le fichier de "
            "questions.")
            sys.exit(1)
    else:
        index = random.randint(0, len(question_lst)-1)
    question = question_lst[index]
    
    context['text'] = ""
    context['form'] = ""
    context['goods'] = []
    context['bads'] = []
    
    context['text'] += question._text+"\n\n"
    
    # Total possible option and random combination
    max_answer = 8 # This bounds the number of option if there are more
    min_answer = 4 # This minimizes the number of option  
    total = len(question._goods) + len(question._bads)
    max_option = min(max_answer, total)
    min_option = min(min_answer, total)
    nb_option = random.randint(min_option, max_option)
    indices = knuth_mixing(subset_index(total, nb_option))
    
    # generation of the form
    for index in indices:
        if index < len(question._goods):
            context['goods'].append(str(index))
            context['form'] +='<input type="checkbox" name="c_' + str(index) + \
            '" value="' + str(index) + '" id="form_' + str(index) + '">' + \
            question._goods[index] + "<br />"
        else:
            context['bads'].append(str(index))
            context['form'] +='<input type="checkbox" name="c_' + str(index) + \
            '" value="' + str(index) + '" id="form_' + str(index) + '">' + \
            question._bads[index - len(question._goods)] + "<br />"
            
    
    with open(sys.argv[2], 'w+') as f:
        json.dump(context, f)
        
    sys.exit(0)

sys.exit(0)

