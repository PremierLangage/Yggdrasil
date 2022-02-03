extends = /model/math/tuple.pl

title = Antécédent

before ==
var('n m')
expr = choice(sympify(exprlist))
f = Lambda((n, m), expr)

E1 = choice(["N","Z"])
if E1=="N":
    x1 = randint(0, 3)
    E1_tex="\mathbb{N}"
else:
    x1 = randint(-3, 3)
    E1_tex="\mathbb{Z}"

E2 = choice(["N","Z"])
if E2=="N":
    x2 = randint(0, 3)
    E2_tex = "\mathbb{N}"
else:
    x2 = randint(-3, 3)
    E2_tex = "\mathbb{Z}"

y = f(x1, x2)

v1, v2 = sample(['n', 'm', 'p', 'q'], 2)
# conflict between subs
expr = expr.subs([(n, Symbol(v1)), (m, Symbol(v2))])
sol = Tuple(3, 4)
==

question ==
On considère la fonction $! f : {{E1_tex}} \times {{E2_tex}} \rightarrow \mathbb{Z} !$ telle que
$$f( {{ v1 }}, {{ v2 }})= {{ expr|latex }}$$
Déterminer un antécédent de $! {{y|latex}} !$ par  $! f !$
==

evaluator ==
from ast import literal_eval
from evalsympy import eval_tuple
from latex2sympy import latex2sympy
def evalans(strans):
    """
    Evaluate an answer when the solution is a tuple/vector.
    """
    try:
        ans = latex2sympy(strans, {})
    except:
        return (-1,"NotTuple")
    if not isinstance(ans, tuple) or len(ans) != 2:
        return (-1,"NotTuple")
    if f(*ans) != y:
        return (0, "NotEqual")
    return (100, "Success")
score, error = evalans(answers['math'])

feedback = message[error]
==


solution ==
La solution est.
==