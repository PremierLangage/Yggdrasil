extends = /model/math/input.pl

title = Démonstration math/input

before ==

==

text ==
Entrer une expression mathématique.
==
symbol_dict = {'m': meter}

evaluator ==
from sympy.physics.units.definitions.unit_definitions import meter, gram, kilogram, second, ampere, \
kelvin, mole, candela, newton, joule, watt, pascal, hertz, coulomb, volt, ohm, centimeter

from sympy.physics.units import convert_to
from latex2sympy import latex2sympy
from sympy import srepr, fraction, sympify, E
from evalsympy import is_rat_simp
codelatex = answers['math']

ans = latex2sympy(codelatex, local_dict={'m': meter, 'cm': centimeter})
try:
    str_ans = str(ans)
    srepr_ans = srepr(ans)
    test_ans = convert_to(ans, meter)
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
