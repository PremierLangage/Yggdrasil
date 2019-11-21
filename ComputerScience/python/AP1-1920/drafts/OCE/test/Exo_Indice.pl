extends = Yggdrasil/ComputerScience/python/AP1-1920/templates/generic/generic.pl

title = Manipulation simple de listes

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
def creation_liste():
    liste=[1,2,3,4,5]
    for i in range(0,3):
        print(liste[i])
    liste[1] = 17
    liste[3] = liste[2]+liste[4]
    for i in range(12):
        print(liste[len(liste)-1)])

begin_test_group("Groupe de tests pour tester les tests")
for x in range(5):
    set_inputs([x]) # dire quelle variable existe dans l'espace
    run() # Exécution du code de l'élève
    if eval(pl_context["solution"], {"x":x}):
        assert_output("Vrai\n")
    else:
        assert_output("Faux\n")
    assert_no_global_change()
end_test_group()

==
