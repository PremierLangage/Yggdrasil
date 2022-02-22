extends = /model/multistep/basic.pl

intro ==
Deux questions.
==

before == #|python|
sequence = [StepTextInput(), StepRadio()]

sequence[0].question = "Quelle est la capitale de la France ?"
sequence[0].input.sol = "Paris"
sequence[0].solution = "Paris"

sequence[1].question = "Quelle est la superficie de la France ?"
sequence[1].set_items(["150 000 km²", "550 000 km²", "1 000 000 km²"])
sequence[1].set_sol(1)
==


