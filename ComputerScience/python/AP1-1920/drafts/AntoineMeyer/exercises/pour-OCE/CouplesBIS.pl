#author=OCE

# Heritage d'un type d'exercice 
extends = ../../templates/generic/generic.pl

title = Couples (X,Y)

taboo=while
needed=for

text==  
Écrivez un script qui affiche tous les couples ( x , y ), x étant un entier positif compris entre 1 et p et y un entier positif 
compris entre 1 et q ; <br>
p et q sont deux entiers acquis au clavier. <br>
L’affichage doit se faire comme sur l’exemple suivant, qui correspond à p = 3 et q = 5:

( 1, 1 ) ( 1, 2 ) ( 1, 3 ) ( 1, 4 ) ( 1, 5 )<br>
( 2, 1 ) ( 2, 2 ) ( 2, 3 ) ( 2, 4 ) ( 2, 5 )<br>
( 3, 1 ) ( 3, 2 ) ( 3, 3 ) ( 3, 4 ) ( 3, 5 )<br>
==

grader== #|python|

import re

# Solution
def couple(x,y):
    p=int(input())
    q=int(input())
    for i in range(p):
        ligne=""
        for j in range(q):
            ligne += "("+str(i+1)+","+str(j+1)+") "
        print(ligne)

# Vérifier la présence d'un mot taboo dans le code de l'étudiant
def checktaboo(taboo, answer):
    x = re.sub("(\"(.|\n)*\"|#.*)", "", answer) #enlève les commentaires et les chaînes de caractères
    # FIXME la chaine de caractère ""  letaboo "" est elle trouvée par la regex suivante ? 
    return re.search("(^"+taboo+"\s|[^\"]+"+taboo+"\s)", x) != None

dic = pl_context
student = _get_student_code(dic)

# Vérification dans le code de l'étudiant de la non présence du taboo
if "taboo" in dic:
    if checktaboo(dic['taboo'], student):
        sandboxio.output(0, "ATTENTION : Le mot clef " + dic['taboo'] + " est proscrit.")
        sys.exit(1)
# Vérification dans le code de l'étudiant de la présence du needed
if "needed" in dic:
    if not checktaboo(dic['needed'], student):
        sandboxio.output(0, "ATTENTION : Le mot clef " + dic['needed'] + " est demandé.")
        sys.exit(1)

begin_test_group("Facile")
set_title(f"n = {1,2}")
set_globals(n={1,2})
run()
assert_output(f"{couple(1,2)}\n")
end_test_group()

begin_test_group("Normal")
set_title(f"n = {3,5}")
set_globals(n={3,5})
run()
assert_output(f"{couple(3,5)}\n")
end_test_group()

begin_test_group("Grand")
set_title(f"n = {30,46}")
set_globals(n={30,46})
run()
assert_output(f"{couple(30,46)}\n")
end_test_group()
==










