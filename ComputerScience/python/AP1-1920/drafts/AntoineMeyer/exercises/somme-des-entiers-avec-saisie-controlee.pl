# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Somme des entiers (avec saisie contrôlée)

text==
Écrire un programme Python qui demande à l'utilisateur un entier positif `n`,
puis calcule et affiche la somme des `n` premiers entiers. 

En cas de saisie d'un entier négatif, le programme doit demander une nouvelle saisie. 
En cas de saisie d'une chaîne impossible à convertir, le programme doit provoquer une erreur.

Voici un exemple d'exécution possible :

    Saisir un entier positif : -4
    Mauvaise saisie
    Saisir un entier positif : -10
    Mauvaise saisie
    Saisir un entier positif : 10
    La somme des entiers de 1 à 10 vaut 55

Il est important de respecter *précisément* cet affichage pour que la solution 
soit considérée comme correcte.
==

grader==#|python|

solution = """
n = int(input("Saisir un entier positif : "))
while n < 0:
    print("Mauvaise saisie")
    n = int(input("Saisir un entier positif : "))
somme = 0
for i in range(n + 1):
    somme += i
print("La somme des entiers de 1 à " + str(n) + " vaut " + str(somme))
"""

saisies_sans_erreur = [["10"], ["12"], ["1"], ["0"]]

saisies_avec_erreurs = [
    ["-4", "-10", "10"],
    ["-4", "-10", "-10", "-1", "-3", "1"]]

def affichage_attendu(saisie):
    i = 0
    res = ""
    while i < len(saisie) and int(saisie[i]) < 0: 
        res += f"Saisir un entier positif : {saisie[i]}\n"
        res += "Mauvaise saisie\n"
        i += 1
    res += f"Saisir un entier positif : {saisie[i]}\n"
    n = int(saisie[i])
    somme = 0
    for i in range(n + 1):
        somme += i
    res += f"La somme des entiers de 1 à {n} vaut {somme}\n"
    return res

begin_test_group("Saisies sans erreur")
for saisie in saisies_sans_erreur:
    run(inputs=saisie, output=affichage_attendu(saisie))

begin_test_group("Saisies avec erreurs")
run(inputs=["bonjour"], exception=Exception)
for saisie in saisies_avec_erreurs:
    run(inputs=saisie, output=affichage_attendu(saisie))

==



