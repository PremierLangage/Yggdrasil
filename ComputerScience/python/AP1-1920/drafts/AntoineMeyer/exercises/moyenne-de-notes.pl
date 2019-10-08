# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Moyenne de notes

text==
Écrivez un programme qui permet à l'utilisateur de saisir une suite de notes 
(nombres flottants compris entre 0 et 20), et qui affiche le nombre de notes 
saisies et leur moyenne (ou `'pas de moyenne'` si aucune note correcte n'a 
été saisie). 

Le nombre de notes n'est pas connu à l'avance, l'utilisateur devra saisir le 
texte `'stop'` pour indiquer qu'il souhaite s'arrêter. 

Le programme devra également afficher un message d'erreur si une note saisie 
est incorrecte, et ne devra pas la prendre en compte dans le calcul.

**Voici un exemple d'interaction avec le programme :**

    Saisir une note entre 0 et 20 ou stop pour arrêter : 12
    Saisir une note entre 0 et 20 ou stop pour arrêter : 14
    Saisir une note entre 0 et 20 ou stop pour arrêter : -5
    Note non prise en compte
    Saisir une note entre 0 et 20 ou stop pour arrêter : 21
    Note non prise en compte
    Saisir une note entre 0 et 20 ou stop pour arrêter : stop
    Nombre de notes : 2
    Moyenne : 13

**En voici un autre exemple :**

    Saisir une note entre 0 et 20 ou stop pour arrêter : -5
    Note non prise en compte
    Saisir une note entre 0 et 20 ou stop pour arrêter : 21
    Note non prise en compte
    Saisir une note entre 0 et 20 ou stop pour arrêter : stop
    Nombre de notes : 0
    Moyenne : pas de moyenne
==

grader==#|python|

saisies_sans_erreur = [["10", "stop"], ["12", "14", "16", "stop"], ["stop"]]

saisies_avec_erreurs = [
    ["-1", "21", "40", "stop"], 
    ["12", "-1", "-1", "14", "16", "stop"],
    ["1"] + ["-1"] * 30 + ["stop"]
]

def affichage_attendu(saisie):
    nb = 0
    somme = 0
    res = ""
    for ligne in saisie:
        res += f"Saisir une note entre 0 et 20 ou stop pour arrêter : {ligne}\n"
        if ligne == 'stop':
            break
        elif 0 <= float(ligne) <= 20:
            nb += 1
            somme += float(ligne)
        else:
            res += "Note non prise en compte\n"
    res += f"Nombre de notes : {nb}\n"
    moyenne = somme / nb if nb else 'pas de moyenne'
    res += f"Moyenne : {moyenne}\n"
    return res

begin_test_group("Saisies sans notes incorrectes")
for saisie in saisies_sans_erreur:
    run(inputs=saisie, output=affichage_attendu(saisie))

begin_test_group("Saisies avec notes incorrectes")
run(inputs=["bonjour"], exception=Exception)
for saisie in saisies_avec_erreurs:
    run(inputs=saisie, output=affichage_attendu(saisie))
==

