extends = /model/math/input.pl

title = 

before ==

==

question ==
Entrer une expression mathématique.
==

symbol_dict = {'e': E}

evaluator2 ==
from latex2sympy import latex2sympy
from sympy import srepr, fraction, sympify, E
from evalsympy import is_rat_simp
codelatex = answers['math']
ans = latex2sympy(codelatex, local_dict=sympify(symbol_dict))

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

keypad = []

feedback2 ==
<ul>
    <li> Code LaTeX : {{ codelatex }} </li>
    <li> Objet Sympy : {{ str_ans }} </li>
    <li> Représentation : {{ srepr_ans }} </li>
    <li> Test : {{ test_ans }} </li>
</ul>
==
