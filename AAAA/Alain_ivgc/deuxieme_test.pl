extends = /model/basic/numeric.pl 


question==
Calculer le coefficient directeur de la droite passant par les points ({{a}},{{b}}) et ({{c}},{{d}}).

==

before==

a = randint(-3, 3)
b = randint(-3, 3)
while True:
    c = randint(-3, 3)
    if c != a: break
d = randint(-3, 3)

sol = (d-b)/(c-a)

==

# clé pour entrer un script au moment de l'évaluation de la réponse
# connaît ce qu'il y a dans before et ce qu'il y a dans ans (la réponse de l'étudiant)
# voir un exemple dans numeric/findnumber.pl mais je trouve pas ce fichier
# dans l'evaluator, on donne un score entre 0 et 100, -1 si on veut retourner une erreur de syntaxe

evaluator==


==
