extends = /model/math/input.pl

title = Démonstration math/expr

before ==

==

text ==
Entrer une expression mathématique.
==

evaluator ==
from latex2sympy import latex2sympy
from sympy import srepr

codelatex = answers['math']

try:
    ans = latex2sympy(codelatex)
    str_ans = str(ans)
    srepr_ans = srepr(ans)
except:
    str_ans = ""
    srepr_ans = ""

score = -1
==

feedback ==
Code LaTeX : {{ codelatex }}

Objet Sympy : {{ str_ans }}

Représentation : {{ srepr_ans }}
==
