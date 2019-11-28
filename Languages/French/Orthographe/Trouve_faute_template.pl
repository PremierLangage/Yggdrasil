# ***************************************************************************
#                     PATRON D'EXERCICE TROUVE FAUTE 
#
# Des phrases arrivent aléatoirement devant l'apprenant. Ce dernier doit
# localiser la faute d'orthographe ou alors cliquer sur un bouton pour 
# dire qu'il pense que la phrase est correcte.
#
# Pour chaque règle d'orthographe, l'apprenant doit valider son apprentissage
# en appliquant la règle correctement 5 fois d'affiléée (changer la valeur de 
# la variable consecutive_to_validate). Si, au contraire, vous préférez que
# l'apprenant valide un certain nombre de bonne réponse (pas forcément 
# consécutives), il vous faut alors changer la valeur de nb_good_to_validate 
# pour un objectif entier et positif.
#
# Pour toute suggestion et/ou correction, contacter un informaticien ou
# l'auteur à son adresse mail : nicolas dot borie at u-pem dot fr
#
# ***************************************************************************

@ /utils/sandboxio.py
@ /Languages/French/Orthographe/trouve_faute_utils.py
grader =@ /grader/evaluator.py

title=Définissez un titre en héritant de ce template
author=Nicolas Borie

file_list==
[]
==

nb_good_to_validate=-1
consecutive_to_validate=5
recall_rule=False

text==

==

form==
<center>
{{ selectable|component}}
</center>
==

builder==#|python|
import sys
import json

def diff_detect(s1, s2):
    """
    Return the list of indices of words different in sentences `s1` and `s2`.
    This function is closed to assume that s1 and s2 has the same lenght.
    """
    indices = []
    token1 = s1.split(' ')
    token2 = s2.split(' ')
    i = 0
    while i<len(token1) and i<len(token2):
        if token1[i] != token2[i]:
            indices.append(i)
        i += 1
    return indices

def parse_file(filename):
    """
    Parse the orthographe file rule whose name is `filename`.

    Return a Python dictionnary of the following shape
    rule_name : "name of the rule"
    rule_description : "text describing the rule"
    sentences : [("bad sentence", "good sentence", "explain error")]
    """
    d = {}
    with open(filename) as f:
        content = f.read()
    tokens = content.split("\n\n")
    d["sentences"] = []
    for tok in tokens:
        tok_short = tok[tok.find(":")+2:]
        if "règle" in tok[:tok.find(":")-1]:
            d["rule_name"] = tok_short
        elif "description" in tok[:tok.find(":")-1]:
            d["rule_description"] = tok_short
        else:
            if len(tok) >= 10:
                tok = tok.split("mauvais : ")[1]
                bad_sentence = (tok.split("bon : ")[0]).replace('\n', '')
                tok = tok.split("bon : ")[1]
                good_sentence = (tok.split("explication : ")[0]).replace('\n', '')
                tok = tok.split("explication : ")[1]
                explaination = tok.replace('\n', '')
                d["sentences"].append( (bad_sentence, 
                                        good_sentence, 
                                        explaination, 
                                        diff_detect(bad_sentence, good_sentence)) )
    return d

if __name__ == "__main__":
    with open(sys.argv[1],'r') as f:
        context = json.load(f)

    list_filename = eval(context['file_list'])
    
    n = len(list_filename)
    text_exo="Vous devrez corriger des phrases illutrant "
    if (n >= 2):
        text_exo += str(n)+" règles orthgraphiques."
    else:
        text_exo += "une règle d'orthgraphe. "
    text_exo += "Pour chacune des phrases, vous devrez selectionner le mot portant "
    text_exo += "l'erreur d'orthographe ou bien cliquer sur le bouton phrase correcte.\n"

    if (eval(context['recall_rule'])):
        if (n >= 2):
            text_exo += "<br /><br /><u>Voici les règles sur lesquelles nous allons travailler :</u><br /><br />"
        else:
            text_exo += "<br /><br /><u>Voici la règle sur laquelle nous allons travailler :</u><br /><br />"
    
    for name in list_filename:
        context['rules'] = []
        d = parse_file(name)
        context['rules'].append(d)
        if (eval(context['recall_rule'])):
            text_exo += '<div style="padding:4px; border:4px solid #BBFFBB;">'
            text_exo += '<div style="padding:10px; background-color:#BBFFBB;">'
            text_exo += "<h2>"+d["rule_name"]+"</h2><br />"
            text_exo += "<p>"+d["rule_description"]+"</p>"
            text_exo += '</div></div><br />'
    
    # for parsing debug
    # for d in context['rules']:
    #     for s in d['sentences']:
    #         text_exo += str(s)+"<br /><br />"

    context['text'] = text_exo
    context['start'] = False
    context['nb_rule'] = len(context['rules']) 

    with open(sys.argv[2], 'w+') as f:
        json.dump(context, f)
    sys.exit(0)

==

selectable =: Text
selectable.text = 
selectable.mode = word

evaluator==#|python|
import random


# INITIALISATION DURING FIRST CALL OF THE GRADER
if not start:
    text = ""
    start = True
    nb_question = 0                      # total number of question
    nb_good = 0                          # total number of good answer
    validate = False                     # is the full EXO finished ?
    nb_good_rule = [0,] * nb_rule        # number goods by rule
    nb_consec_rule = [0,] * nb_rule      # consecutive by rule
    validated_rules = [False, ]*nb_rule  # are rules validated ?
    need_grade = False                   # register if grade if needed
    need_sentence = True                 # register if a new sentence if needed
    need_feedback = False                # if a feedback need to be displayed
    last_rule_index = -1                 # index of tested rule
    last_sentence_index = -1             # index of sentence inside the rule
    last_sentence_status = -1            # good_sentence : 1 bad_sentence : 0
    nb_good_to_validate=int(nb_good_to_validate)
    consecutive_to_validate=int(consecutive_to_validate)


# DO WE NEED TO GRADE ANSWER NOW
if need_grade:
    nb_question += 1
    if last_sentence_status == 1:          # good sentence : no selections
        if len(selectable.selections) == 0:
            q_result=True
        else:
            q_result=False
    else:                                  # bad sentence : full diff selection
        if [e['index'] for e in selectable.selections] == rules[last_rule_index]['sentences'][last_sentence_index][3]:
            q_result=True
        else:
            q_result=False

    selectable.selections = []             # in all case : unselect all word
    
    # IN CASE OF GOOD ANSWER
    if q_result:
        nb_good += 1
        nb_good_rule[last_rule_index] += 1
        nb_consec_rule[last_rule_index] += 1
        need_grade = True
        need_sentence = True
        if 'valid_index' in rules[last_rule_index]:
            rules[last_rule_index]['valid_index'].append(last_sentence_index)
        else:
            rules[last_rule_index]['valid_index'] = [last_sentence_index]

        # GOOD ANSWER : CHECK HERE RULE VALIDATION
        if nb_good_to_validate != -1:
            if nb_good_rule[last_rule_index] >= nb_good_to_validate:
                validated_rules[last_rule_index] = True
        else:
            if nb_consec_rule[last_rule_index] >= consecutive_to_validate:
                validated_rules[last_rule_index] = True

        # GOOD ANSWER : CHECK HERE IF FULL EXO IS FINISHED 
        if validated_rules[last_rule_index] == True:
            validate = True
            for i in range(nb_rule):
                if not validated_rules[i]:
                    validate = False

    # IN CASE OF BAD ANSWER
    else:
        nb_consec_rule[last_rule_index] = 0
        need_grade = False
        need_sentence = False

# IF THE FULL EXO IS NOT FINISHED
if not validate:

    # TWO CASES : MAKE A FEEDBACK OR PREPARE A QUESTION 
    if need_feedback:
        need_feedback = False
        need_grade = False
        grade = (-1, "C' est pas bien il fallait si et ça !")

    # NO FEEDBACK TO DISPLAY SO A QUESTION TO SELECT
    else:
        need_grade = True
        # RULE SELECTION
        last_rule_index = random.randint(0, nb_rule-1)
        while (validated_rules[last_rule_index]):
            last_rule_index = random.randint(0, nb_rule-1)

        # good/bad sentences
        if random.randint(0,1) == 1:
            last_sentence_status = 0
        else:
            last_sentence_status = 1

        # UNVALIDATE ALL IF ALL IS VALIDATED
        if ('valid_index' in rules[last_rule_index]) and len(rules[last_rule_index]['valid_index']) == len(rules[last_rule_index]['sentences']):
            for i in range(rules[last_rule_index]['sentences']):
                rules[last_rule_index]['valid_index'] = []

        # TAKE A RADOM UNVALIDATE SENTENCE
        last_sentence_index = random.randint(0, len(rules[last_rule_index]['sentences'])-1)
        while ('valid_index' in rules[last_rule_index]) and (index_sentence in rules[last_rule_index]['valid_index']):
            last_sentence_index = random.randint(0, len(rules[last_rule_index]['sentences'])-1)

        selectable.text = rules[last_rule_index]['sentences'][last_sentence_index][last_sentence_status]
        grade = (-1, " ")

# ELSE THE EXO IS FINISHED 
else:
    selectable.text = ''
    final_grade = int(nb_good*100.0 / nb_question)
    grade = (final_grade, "Félicitation, vous validez avec " + str(final_grade) + "% de réussite.")

==







