extends=../AntoineMeyer/templates/generic/generic.pl

@ interval.py
@ /builder/before.py [builder.py]

title=Intervales

text==
Ecrivez un programme qui prend en entrée un entier et affiche "Vrai" si l'entier est dans l'interval $%{{ latex }}%$ et "Faux" sinon.
==


before==
import interval

_interval = interval.makeinterval()
latex = _interval[0]
solution = _interval[1]
code = solution
==

grader==
from itertools import permutations

begin_test_group("Groupe de tests pour tester les tests")
set_inputs(["5"])
run()
assert_output(solution)
assert_no_global_change()
end_test_group()


==

