extends = /model/physicsinput.pl

title = Résistance d'une lampe

input.virtualKeyboards = elementary

before ==
U = 2*randint(5,15)*volt
I = randint(1,20)/2*ampere
sol = convert_to(U/I, ohm)
==

text ==
Une lampe est traversée par un courant de $! {{I|latex}} !$. La tension aux bornes de la lampe est $! {{U|latex}} !$. Déterminer la résistance de la lampe.
==

evaluator ==
unit_dict = {'m': meter, 'g': gram, 'kg': kilogram, 's': second, 'A': ampere, 'K': kelvin, 'mol': mole, 'cd': candela, 'N': newton, 'J': joule, 'W': watt, 'Pa': pascal, 'Hz': hertz, 'C': coulomb, 'V': volt, 'Omega': ohm}

score, feedback, _ = eval_physical(input.value, sol, tol=1e-2, local_dict=unit_dict)
==



