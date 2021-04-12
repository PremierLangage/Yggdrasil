extends = /model/math/input.pl

title = Démonstration math/input

before ==

==

text ==
Entrer un intervalle.
==

evaluator ==
from latex2sympy import latex2interval, latex2rset
from sympy import srepr, fraction
from evalsympy import is_rat_simp
codelatex = answers['math']
try:
    ans = latex2rset(codelatex)
    str_ans = str(ans)
    srepr_ans = srepr(ans)
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
</ul>
==

settings.feedback = 
