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
# ***************************************************************************

@ /utils/sandboxio.py
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

==

builder==#|python|
import sys
import json

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
    for tok in tokens:
        tok_short = tok[tok.find(":")+2:]
        if "règle" in tok[:tok.find(":")-1]:
            d["rule_name"] = tok_short
        elif "description" in tok[:tok.find(":")-1]:
            d["rule_description"] = tok_short
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
            text_exo += "\nVoici les règles sur lesquelles nous allons travailler :\n"
        else:
            text_exo += "\nVoici la règle sur laquelle nous allons travailler :\n"
    
    for name in list_filename:
        d = parse_file(name)
        if (eval(context['recall_rule'])):
            text_exo += "\n"+d["rule_name"]+"\n"
            text_exo += "\n"+d["rule_description"]+"\n"
    
    context['text'] = text_exo
    
    with open(sys.argv[2], 'w+') as f:
        json.dump(context, f)
    sys.exit(0)

==


evaluator==#|python|

==






