extends = /model/basic/numinput.pl


# Creation d'exercice 
before == #|py|
# TIRAGE ALEATOIRE
a = randint(10, 50)
b = randint(10, 50)

# CALCUL DE LA BONNE RÉPONSE 
sol = a + b
==

question ==
Calculer {{ a }} + {{ b }}.
==
