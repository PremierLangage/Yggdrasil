extends = /model/math/input.pl


title = Graphique

before ==
from plmpl import plotsvg
x = symbols('x')
a = Rational(randint(-4, 4, [0]),2)
b = randint(-2, 2)
image = plotsvg(a*x+b)
==

text ==
<div class="img-container">
{{ image }}
</div>
==

form ==

==


evaluator ==
from ast import literal_eval
from sympy import sympify
from evalsympy import eval_expr
score, error = eval_expr(answers['math'], sol, checkratsimp=literal_eval(checkratsimp), unauthorized_func=literal_eval(unauthorized_func), local_dict=sympify(symbol_dict))
feedback = message[error]
==

