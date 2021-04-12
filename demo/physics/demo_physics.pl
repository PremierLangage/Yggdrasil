extends = /model/math/input.pl

title = Démonstration math/input

before ==

==

text ==
Entrer une expression mathématique.
==
symbol_dict = {'V': vol}

evaluator ==
from sympy.physics.units.definitions.unit_definitions import meter, gram, kilogram, second, ampere, \
kelvin, mole, candela, newton, joule, watt, pascal, hertz, coulomb, volt, ohm

from latex2sympy import latex2sympy
from sympy import srepr, fraction, sympify, E
from evalsympy import is_rat_simp
codelatex = answers['math']

try:
    ans = latex2sympy(codelatex, local_dict=sympify(symbol_dict))
    str_ans = str(ans)
    srepr_ans = srepr(ans)
    test_ans = is_rat_simp(ans)
except:
    str_ans = ""
    srepr_ans = ""

score = -1
==

feedback ==
<ul>
    <li> Code LaTeX : {{ codelatex }} </li>
    <li> Objet Sympy : {{ str_ans }} </li>
    <li> Représentation : {{ srepr_ans }} </li>
    <li> Test : {{ test_ans }} </li>

</ul>
==

settings.feedback = 
