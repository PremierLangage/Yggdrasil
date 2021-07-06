extends = /model/basic/numeric.pl 

title = test2

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
