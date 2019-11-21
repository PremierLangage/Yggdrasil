extends = Yggdrasil/ComputerScience/python/AP1-1920/templates/generic/generic.pl

title = navigation dans les listes

text==  
Créer un programme permettant : 

<ul>
    <li>d'initialiser une liste de 5 entiers</li>
    <li>Afficher les 3 premiers éléments</li>
    <li>Modifie la liste en remplaçant L[1] par 17 et L[3] par la somme des cases voisines L[2] et L[4] </li>
    <li>Affiche 12 fois la valeur du dernier terme de la liste </li>
</ul>
==

grader== #|python|

# Solution
def creation_liste(x):
    liste=[1,2,3,4,5]
    for i in range(0,3):
        print(liste[i])
    liste[1] = 17
    liste[3] = liste[2]+liste[4]
    for i in range(12):
        print(liste[len(liste)-1)])

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
        sandboxio.output(0, "ATTENTION : Le mot clef " + dic['needed'] + " est demandé.\n" + student)
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
