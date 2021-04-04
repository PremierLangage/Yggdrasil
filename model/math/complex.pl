extends = /model/mathquill.pl


before ==
z1 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
z2 = rd.randint(-5, 5) + rd.randint(-5, 5)*I
sol = (z1 * z2).expand()
==

text ==
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2 = {{ z2|latex }} !$. 

Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

input_prefix = Réponse :
imaginary_unit = i
complex_form = 
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

evaluator ==
from ast import literal_eval
score, error = eval_complex(answers['math'], sol, imaginary_unit=imaginary_unit, form=complex_form, checkratsimp=literal_eval(checkratsimp), unauthorized_func=literal_eval(unauthorized_func), local_dict=sympify(symbol_dict))
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

