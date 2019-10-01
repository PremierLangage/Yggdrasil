extends=../../templates/generic/generic.pl

@ interval.py

title=Intervales test_reload

text==
Ecrivez un programme qui prend en entrée un entier et affiche "Vrai" si l'entier est dans l'interval $%{{ latex }}%$ et "Faux" sinon.
==


before==
import interval

_interval = interval.makeinterval()
latex = _interval[0]
solution = _interval[1]
==

grader==
from itertools import permutations

begin_test_group("Groupe de tests pour tester les tests")
for x in range(5):
    set_inputs([x])
    run()
    assert_output(eval(solution, locals={"x":x}))
    assert_no_global_change()
end_test_group()


==




