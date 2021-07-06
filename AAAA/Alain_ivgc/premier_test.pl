extends = /model/basic/numeric.pl 
# j'importe le modèle de base

# si pas besoin d'aléa :
#question = "Ma question"
#sol=1 

# avec aléa

title= test1

settings.oneshot=yes
settings.allow_reroll=yes

question==
Calcul le produit de {{A}} et {{P}}.

==

before==

A = randint(1, 5)*10
P = choice([1, 2, 5, 7, -3])

sol = A*P

==

# pour que l'étudiant ne puisse pas afficher la solution après avoir testé l'exercice
solution = ""

# clé pour entrer un script au moment de l'évaluation de la réponse
# connaît ce qu'il y a dans before et ce qu'il y a dans ans (la réponse de l'étudiant)
# voir un exemple dans numeric/findnumber.pl mais je trouve pas ce fichier
# dans l'evaluator, on donne un score entre 0 et 100, -1 si on veut retourner une erreur de syntaxe

#evaluator==


#==