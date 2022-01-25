#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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
@ /ComputerScience/OperatingSystem/templates/utils_bash.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author=Nicolas Borie
title=Méta-caractères * et ? en terminal

tag=méta-caractère|terminal|ls

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random
import subprocess

alphabet_size=5
max_len_word=8
nb_words=8

def aleaword(alphabet, max_len):
    w = ""
    len_word = random.randint(1, max_len)
    for i in range(len_word):
        w += chr(ord('a')+random.randint(0, alphabet-1))
    return w

def aleapattern(alphabet, max_len):
    w = ""
    len_word = random.randint(1, max_len-2)
    letters = [chr(ord('a')+i) for i in range(alphabet)] + ['*']*alphabet + ['?']*alphabet
    for i in range(len_word):
        w += random.choice(letters)
    return '*'+w+'*'

def full_exp(alphabet, max_len, nb):
    """
    Return a nice triplet (words, patten, solutions) to learn what is wild cards.
    """
    list_word = []
    while len(list_word) < nb:
        w = aleaword(alphabet_size, max_len_word)
        if w not in list_word:
            list_word.append(w)
    pattern = aleapattern(alphabet_size, max_len_word)

    cmd = 'mkdir plop; cd plop; touch '+' '.join(list_word)+'; ls '+pattern
    sp = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    output = sp.communicate(timeout=1)[0].decode()
    solution = []
    if not 'cannot' in output:
        solution = output[:-1].split('\n')
    if len(solution) > 0 and len(solution) < nb:
        return (list_word, pattern, solution)
    else:
        cmd = 'cd.. ;rm -rf plop'
        sp = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        output = sp.communicate(timeout=1)[0].decode()
        return full_exp(alphabet, max_len, nb)

list_word, pattern, solution = full_exp(alphabet_size, max_len_word, nb_words)

group.items = []
for w in list_word:
    group.items.append({"id": w, "content": w})

# shuffle the items
random.shuffle(group.items)
==

text==#|markdown|
<u>Rappels:</u>

 * `*` méta-caractères se substituant à l'importe quel mot (y compris le mot vide).   
 * `?` méta-caractères se substituant à n'importe quel caractère.   

On se trouve dans un répertoire contenant les fichiers suivants:

<br>

    nborie@PLaTon:~$ ls
    {% for w in list_word %}{{ w }} {% endfor %}
    nborie@PLaTon:~$ ls {{ pattern }}

Selectionner les nons de fichiers qui seront attrapés et affichés par la commande `ls` précédante !
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
from utils_bash import display_as_shell_this, frame_message

form=''

right = 0
total = 0
for item in group.items:
    checked = item['checked']
    content = item['content']
    total += 1
    if content in solution:
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
    elif checked:
        item['css'] = 'error-border'
    else:
        right += 1

score = max([0, 100 - ((total-right)*50) ])
if score == 100:
    grade = (score, frame_message("Quel talent!", "ok"))
else:
    feedb = "Quelques erreurs ici et l&agrave;... <br>Il fallait selectionner "+" ".join(solution)+"."
    grade = (score, frame_message(feedb, "error"))
==
