extends=../AntoineMeyer/templates/generic/generic.pl

@ interval.py
@ /builder/before.py [builder.py]

title=Intervales

text==
Ecrivez un programme qui prend en entrée un entier et affiche "Vrai" si l'entier est dans l'interval $%{{ latex }}%$ et "Faux" sinon.
==


before==
import interval

_iterval = interval.makeinterval()
latex = _iterval[0]
solution = _iterval[1]
code = solution
==

grader==
from itertools import permutations

begin_test_group("Groupe de tests pour tester les tests")
for x, y, z in permutations((1, 2, 3)):
    set_title(f"Exécution avec a = {x}, b = {y}, c = {z}")
    set_globals(a=x, b=y, c=z)
    run()
    assert_output(' '.join(sorted((x, y, z))) + '\n'))
    assert_no_global_change()
end_test_group()


==

