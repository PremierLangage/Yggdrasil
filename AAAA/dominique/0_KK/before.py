

import random
from AMC import parse_AMC_TXT

from aleaq import buildquestion, onefromeachgroup,getmultioption

# Parsing du fichier format AMC
list_questions = parse_AMC_TXT(questions)

# Traitement des options de gestion de l'aléa 
# getmultioption -> possibilité d'utiliser une question plusieurs fois 

l2=[]
for q in list_questions:
    n=getmultioption(q) # default value 1 
    for _ in range(n):
        l2.append(buildquestion(q))
list_questions=l2
# onepergroup -> possibilité de faire une tirage aléatoire dans un groupe de questions

list_questions=[list_questions[0]]

onepergroup = 1

if "onepergroup" in globals() and onepergroup > 0 :
    list_questions=onefromeachgroup(list_questions,onepergroup)
# nbstep réduire la complexité 
if 'nbstep' in globals():
    list_questions = random.sample(list_questions, nbstep)

nbstep = len(list_questions)
if "suffle" in globals() and suffle:
    random.shuffle(list_questions)


step= -1 # première étape 
text= f"Ce test contient {nbstep} questions. Pas de retour arrière et un seul essai ! "
text += str(list_questions)

scores=[]
feedbacks=""
debug=True
if "debug" in globals() and debug:
    import sys
    print(list_questions, file=sys.stderr)

