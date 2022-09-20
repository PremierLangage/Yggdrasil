
def before(debug=False):
    from radio import Radio
    from checkbox import Checkbox
    from textselect import TextSelect
    radio = Radio() 
    check = Checkbox()
    ztext = TextSelect()
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


    scores=[]
    feedbacks=""

    if debug:
        print(list_questions)

if __name__ == "__main__":
    # This part is executed when running the script directly
    # It is not executed when the script is loaded by the server
    print("This script is intended to be loaded by the sandbox and evaluated with a context")
    questions="""
*   Lorsque vous disposez d'un bloc constitué de plus d'une ligne dans un if, comment indiquez vous la fin du bloc ?
+On diminue l'indentation à la ligne suivant le bloc, pour revenir à une indentation identique à celle de la ligne possédant l'instruction if
-On utilise une accolade } après la dernière ligne du bloc if
-On ne met pas le caractère : à la dernière ligne du bloc if
-On met une majuscule à la première lettre de la ligne suivant la fin du bloc if
"""
    before(debug=True)
else:
    before()