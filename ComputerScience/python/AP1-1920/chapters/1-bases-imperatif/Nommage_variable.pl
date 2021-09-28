#author = Olivier Champalle
# + DR
extends=/ComputerScience/python/template/qcm_template.pl

title=Nommage de variables

text=Parmi les chaines suivantes, sélectionnez celles qui sont des noms de variables valides.

mybuild==

def mot_aleatoire(longueur):
    """Renvoie un mot aléatoire (lettres minuscules et majuscules) de la 
    longueur demandée."""
    return "".join(choice(ascii_letters) for _ in range(longueur))


# initialisation des "bases de données" de noms corrects et incorrects
corrects = {  # mots aléatoires
    mot_aleatoire(randint(4, 10)) for _ in range(15)
} | {  # mots aléatoires avec des chiffres à la fin
    mot_aleatoire(randint(4, 10)) + chaine_nombres_aleatoire(randint(1, 5))
    for _ in range(15)
} | {  # mots aléatoires séparés par des "_"
    mot_aleatoire(randint(4, 10)) +  "_" + mot_aleatoire(randint(4, 10)) 
    for _ in range(15)
}
incorrects = set(
    kwlist  # les mots-clés de Python
) | {  # mots aléatoires avec des chiffres au début
    chaine_nombres_aleatoire(randint(1, 5)) + mot_aleatoire(randint(4, 10))
    for _ in range(15)
}
good = list(corrects)
bad= list(incorrects)


nbtrues = random.randint(2,3)
==

nb=6
uncrosedfalse=
Xgood==
abc
bonjour
oui
Ciao
NON
byeBye7
_upem_
good_morning
DEF
limite
axiome
si
sinon
==

Xbad==
au revoir
Hi!
def
6hello6
good-afternoon
True
False
3+4
lim%8
if
==

feedback=show





