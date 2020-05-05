extends = /model/physicsinput.pl

title = Aire d'une surface

input.virtualKeyboards = elementary

before ==
a = (1+ 0.1*randint(1,20))*meter
b = randint(20,60)*centimeter
sol = convert_to(a*b, meter**2)
==

text ==
On considère une surface rectangulaire de $!{{a|latex}}!$ sur $!{{b|latex}}!$. Quelle est son aire ?
==

evaluator ==
unit_dict = {'m': meter,'cm': centimeter, 'g': gram, 'kg': kilogram, 's': second, 'A': ampere, 'K': kelvin, 'mol': mole, 'cd': candela, 'N': newton, 'J': joule, 'W': watt, 'Pa': pascal, 'Hz': hertz, 'C': coulomb, 'V': volt, 'Omega': ohm}

score, _, feedback = eval_physical(input.value, sol, tol=1e-2, local_dict=unit_dict)
==

solution ==
La solution est $!{{sol|latex}}!$.
==

