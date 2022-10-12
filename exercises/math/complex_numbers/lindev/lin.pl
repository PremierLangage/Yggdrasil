
before ==
expr.rewrite(sin, exp).rewrite(cos, exp).expand().rewrite(exp, sin).simplify()
==