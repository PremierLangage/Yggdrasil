extends = /model/math/input.pl

title = Démonstration math/input

before ==
import sympy as sp
d = sp.__version__
==

text ==
{{d}}
Entrer une expression mathématique.
==

evaluator ==
from latex2sympy import latex2sympy
from sympy import srepr, fraction
from evalsympy import is_rat_simp
codelatex = answers['math']
ans = latex2sympy(codelatex)

try:
    ans = latex2sympy(codelatex)
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
