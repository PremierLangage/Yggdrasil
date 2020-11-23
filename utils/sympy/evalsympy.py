import sympy as sp
from latex2sympy import *

# Utils

def equal(a, b, modulo=None):
    """
    Check if two expressions are equal after simplification.
    """
    if a == b:
        return True

    diff = a - b
    if isinstance(diff, sp.Expr) and diff.is_complex:
        diff = sp.expand_complex(diff)
    
    if modulo is None:
        return sp.simplify(diff) == 0
    else:
        return sp.simplify(diff) % modulo == 0

def equal_approx(a, b, tol, modulo=None):
    """
    Check if two expressions are approximately equal.
    """
    if modulo is None:
        return abs(a - b).evalf() < tol
    else:
        return abs((abs(a - b) + modulo/2) % modulo - modulo/2).evalf() < tol

def equal_struct(p, q, modulo=None):
    """
    Check if two nested structures of lists and tuples of expressions 
    (where lists are viewed as sets) are equal.
    
    >>> equal_struct([1,2,3], [3,1,2])
    True
    
    >>> equal_struct([sp.sqrt(2)/2, 0], [0, 1/sp.sqrt(2)])
    True
    
    >>> equal_struct((1,2,3), (3,1,2))
    False
    
    >>> equal_struct([(1, 2), (2, 3)], [(2, 3), (1, 2)])
    True
    """
    
    # comparison of two lists (viewed as sets)
    if isinstance(p, list) and isinstance (q, list):
        if len(p) != len(q):
            return False
        for a in p:
            isin = False
            for b in q:
                if equal_struct(a, b, modulo):
                    isin = True
                    break
            if not isin:
                return False
        return True
     
    # comparison of two tuples       
    elif isinstance(p, tuple) and isinstance (q, tuple):
        if len(p) != len(q):
            return False
        for i in range(len(p)):
            if not equal_struct(p[i], q[i], modulo):
                return False
        return True
    
    # comparison of two expressions        
    elif isinstance(p, (sp.Expr, int)) and isinstance (q, (sp.Expr, int)):
        return equal(p, q, modulo)
    
    # other cases
    else:    
        return False


def duplicates(p):
    """
    Check if there are duplicates in lists inside a nested structure of
    lists and tuples of expressions.
    
    >>> duplicates([1, 2, 3, 2])
    True
    
    >>> duplicates([0, sp.sqrt(2)/2, 1/sp.sqrt(2)])
    True
    
    >>> duplicates([(1, 2), (2, 1)]) 
    False
    
    >>> duplicates([[1, 2], [2, 1]]) 
    True
    """
    
    # search duplicates in lists
    if isinstance(p, list):
        if len(p) > 1:
            for i in range(len(p)):
                for j in range(i+1, len(p)):
                    if equal_struct(p[i], p[j]):
                        return True
    
    # search duplicates in elements of lists and tuples                  
    if isinstance(p, (list, tuple)):
        for a in p:
            if duplicates(a):
                return True

    return False

def arg_nested_add(expr):
    """
    Return the terms of a nested sum.
    """
    if not expr.is_Add:
        return [expr]
    args = []
    for a in expr.args:
        if a.is_Add:
            args = args + arg_nested_add(a)
        else:
            args.append(a)
    return args

def arg_nested_mul(expr):
    """
    Return the terms of a nested product.
    """
    if not expr.is_Mul:
        return [expr]
    args = []
    for a in expr.args:
        if a.is_Mul:
            args = args + arg_nested_mul(a)
        else:
            args.append(a)
    return args
    
def is_coeff_mul(expr, x):
    """
    Check if an expression is of the form 'something times x'.
    """
    args = arg_nested_mul(expr)
    return args.count(x) == 1 and sum([a.has(x) for a in args]) == 1

def coeff_mul(expr, x):
    """
    Return the multiplicative coefficient.
    
    >>> x = sp.Symbol('x')
    >>> expr = sp.sympify("3*x/2", evaluate=False)
    >>> coeff_mul(expr, x)
    3/2
    
    >>> expr = sp.sympify("4*x/2", evaluate=False)
    >>> coeff_mul(expr, x)
    4/2
    
    >>> expr = sp.sympify("(1+sqrt(2))*x", evaluate=False)
    >>> coeff_mul(expr, x)
    1 + sqrt(2)
    
    >>> coeff_mul(x, x)
    1
    """
    args = arg_nested_mul(expr)
    args.remove(x)
    if len(args) == 0:
        return sp.Integer(1)
    elif len(args) == 1:
        return args[0]
    else:
        with sp.evaluate(False):
            return sp.Mul(*args)
    
def is_coeff_exponent(expr, x):
    """
    Check if an expression is of the form 'something times x power something'.
    """
    n = sp.degree(sp.simplify(expr), x)
    if n == 0:
        return True
    args = arg_nested_mul(expr)
    return args.count(x**n)==1 and sum([a.has(x) for a in args])==1
    
def coeff_exponent(expr, x):
    """
    Return the multiplicative coefficient.
    
    >>> x = sp.Symbol('x')
    >>> expr = sp.sympify("3*x**2/2", evaluate=False)
    >>> coeff_exponent(expr, x)
    (3/2, 2)
    
    >>> expr = sp.sympify("4/2", evaluate=False)
    >>> coeff_exponent(expr, x)
    (4/2, 0)
    
    >>> expr = sp.sympify("(1+sqrt(2))*x", evaluate=False)
    >>> coeff_exponent(expr, x)
    (1 + sqrt(2), 1)
    
    >>> coeff_exponent(x**3, x)
    (1, 3)
    """
    n = sp.degree(expr, x)
    if n == 0:
        return (expr, n)
    args = arg_nested_mul(expr)
    args.remove(x**n)
    if len(args) == 0:
        return (sp.Integer(1), n)
    elif len(args) == 1:
        return (args[0], n)
    else:
        with sp.evaluate(False):
            return (sp.Mul(*args), n)

def is_real_or_inf(expr):
    """
    Check if an expression is real or equal to infinity.
    """
    if expr == sp.S.Infinity or expr == sp.S.NegativeInfinity:
        return True
    return expr.is_real and not expr.is_infinite

def is_rat_simp(expr):
    """
    Check if the rational numbers in an expression are simplified.
    
    >>> expr = sp.sympify("2/4", evaluate=False)
    >>> is_rat_simp(expr)
    False
    
    >>> expr = sp.sympify("1 - 1/2", evaluate=False)
    >>> is_rat_simp(expr)
    False
    
    >>> expr = sp.sympify("sqrt(1 + 1)", evaluate=False)
    >>> is_rat_simp(expr)
    False
    
    >>> expr = sp.sympify("1 + sqrt(2)", evaluate=False)
    >>> is_rat_simp(expr)
    True
    """
    if isinstance(expr, sp.Expr):
        if sp.simplify(expr).is_rational:
            return is_frac_int(expr) and is_frac_irred(expr)
        elif expr.is_Atom or expr.is_Boolean:
            return True
        else:
            return all(is_rat_simp(subexpr) for subexpr in expr.args)
    elif isinstance(expr, (list, tuple, sp.Tuple, set, sp.FiniteSet)):
        return all(is_rat_simp(item) for item in expr)
    else:
        return True

def is_frac_int(expr):
    """
    Check if an expression is a fraction of integers.
    
    >>> expr = sp.sympify("3", evaluate=False)
    >>> is_frac_int(expr)
    True
    
    >>> expr = sp.sympify("1 + 3", evaluate=False)
    >>> is_frac_int(expr)
    False
    
    >>> expr = sp.sympify("5*7/2", evaluate=False)
    >>> is_frac_int(expr)
    False
    """
    args = arg_nested_mul(expr)
    # remove sign
    if len(args) > 1 and sp.Integer(-1) in args:
        args.remove(sp.Integer(-1))
    with sp.evaluate(False):
        expr = sp.Mul(*args)
    f = sp.fraction(expr, exact=True)
    return f[0].is_Integer and f[1].is_Integer

def is_frac_irred(expr):
    """
    Check if a fraction of integers is irreducible.
    """
    args = arg_nested_mul(expr)
    # remove sign
    if len(args) > 1 and sp.Integer(-1) in args:
        args.remove(sp.Integer(-1))
    with sp.evaluate(False):
        expr = sp.Mul(*args)
    f = sp.fraction(expr, exact=True)
    return sp.gcd(f[0],f[1]) == 1 and f[1] > 0


def is_complex_cartesian(expr):
    """
    Check if a complex number is in cartesian form.
    
    >>> z = sp.sympify("I * (2 + I)", evaluate=False)
    >>> is_complex_cartesian(z)
    False

    >>> z = sp.sympify("(1 + sqrt(2)) * I + 1 - sqrt(3)", evaluate=False)
    >>> is_complex_cartesian(z)
    True
    
    >>> z = sp.sympify("I + sqrt(2) * I", evaluate=False)
    >>> is_complex_cartesian(z)
    False
    """
    args = arg_nested_add(expr)
    ni = [is_coeff_mul(a, sp.I) for a in args].count(True)
    nr = [a.is_real for a in args].count(True)
    return ni <= 1 and ni + nr == len(args)

def complex_cartesian_parts(expr):
    """
    Return the real and imaginary parts.
    
    >>> z = sp.sympify("(1 + sqrt(2)) * I + 1 - sqrt(3)", evaluate=False)
    >>> complex_cartesian_parts(z)
    (-sqrt(3) + 1, 1 + sqrt(2))
    
    >>> z = sp.sympify("1 + sqrt(2)", evaluate=False)
    >>> complex_cartesian_parts(z)
    (1 + sqrt(2), 0)
    
    >>> z = sp.sympify("I", evaluate=False)
    >>> complex_cartesian_parts(z)
    (0, 1)
    """
    args = arg_nested_add(expr)
    im = next((coeff_mul(a, sp.I) for a in args if is_coeff_mul(a, sp.I)), 0)
    lstre = [a for a in args if a.is_real]
    if len(lstre) == 0:
        re = sp.Integer(0)
    elif len(lstre) == 1:
        re = lstre[0]
    else:
        with sp.evaluate(False):
            re = sp.Add(*lstre)
    return (re, im)


def is_e_i_theta(expr):
    """
    Check if a complex number is an exponential.
    """
    if type(expr)==sp.exp:
        return is_coeff_mul(expr.args[0],sp.I)
    elif type(expr)==sp.Pow and expr.args[0]==sp.E:
        return is_coeff_mul(expr.args[1],sp.I)
    return False

def is_complex_exponential(expr):
    """
    Check if a complex number is in exponential form.
    """
    args=arg_nested_mul(expr)
    if is_e_i_theta(args[-1]):
        for a in args[:-1]:
            if not a.is_real or not a>0:
                return False
        return True
    return False

def is_poly_expanded(expr, x):
    """
    Check if a polynomial is expanded.
    
    >>> x = sp.Symbol('x')
    >>> is_poly_expanded(x * (x + 1), x)
    False
    
    >>> is_poly_expanded(x + x**2 + 3*x, x)
    True
    """
    args = arg_nested_add(expr)
    return all(is_coeff_exponent(a,x) for a in args)

    
def is_poly_ratsimp(expr, x):
    """
    Check if a polynomial is expanded.
    
    >>> x = sp.Symbol('x')
    >>> P = sp.sympify("x + x**2 + 3*x", evaluate=False)
    >>> is_poly_ratsimp(P, x)
    False
    
    >>> P = sp.sympify("1 + x**2 + 3*x", evaluate=False)
    >>> is_poly_ratsimp(P, x)
    True
    
    >>> P = sp.sympify("3*(x**2 + 2)**2", evaluate=False)
    >>> is_poly_ratsimp(P, x)
    True
    """
    args = arg_nested_mul(expr)
    for a in args:
        if type(a) == sp.Pow:
            a = a.args[0]
        with sp.evaluate(False):
            coeffs = sp.Poly(a, x).coeffs()
        if not all(is_rat_simp(c) for c in coeffs):
            return False
    return True

def is_poly_factorized(expr, x, domain='R'):
    """
    Check if a polynomial is factorized.

    >>> x = sp.Symbol('x')
    >>> is_poly_factorized(x**2 - 1, x)
    False

    >>> is_poly_factorized(-(x**2 + 1) * (2*x - 1)**3, x)
    True
    
    >>> is_poly_factorized(3 * (x**2 - 1) * (- x - 1), x)
    False
    
    >>> is_poly_factorized(x**2 + 1, x, domain='C')
    False
    """
    if domain == 'C':
        kwargs = {'extension': [sp.I]}
    else:
        kwargs = {'domain': domain}
        
    args = arg_nested_mul(expr)
    for a in args:
        if type(a) == sp.Pow:
            exponent = a.args[1]
            if exponent.is_Integer and exponent > 0:
                a = a.args[0]
            else:
                return False
        if not sp.Poly(a, x, **kwargs).is_irreducible:
            return False
    return True

def simplify_rset(lst):
    """
    Simplify endpoint in a list of intervals.
    """
    for i, interv in enumerate(lst):
        left = sp.simplify(interv.left)
        right = sp.simplify(interv.right)
        lst[i] =  sp.Interval(left, right, interv.left_open, interv.right_open)
    return lst

def func_in_expr(expr):
    """
    Return the functions involved in an expression.
    
    >>> expr = sp.sympify("sin(p/3)", evaluate=False)
    >>> func_in_expr(expr)
    {sin}
    
    >>> expr = sp.sympify("x + sin(x)**2 * cos(x)", evaluate=False)
    >>> func_in_expr(expr)
    {sin, cos}
    
    >>> expr = sp.sympify("sqrt(ln(1 + x**2))", evaluate=False)
    >>> func_in_expr(expr)
    {log}
    """
    return set([type(a) for a in expr.atoms(sp.Function)])


# Answer evaluation functions

_feedback_ = {
"Success": "",
"NotEqual": "",
"NotExpr": "La réponse doit être une expression mathématique.",
"NotRealOrInf": "La réponse doit être un nombre réel ou $! +\infty !$ ou $! -\infty !$.",
"NotRSet": "La réponse doit être un intervalle ou une réunion d'intervalles.",
"NotCplx": "La réponse doit être un nombre complexe.",
"NotCplxCartesian": "La réponse doit être un nombre complexe sous forme cartésienne.",
"NotCplxExponential": "La réponse doit être un nombre complexe sous forme exponentielle.",
"NotSet": "La réponse doit être un ensemble.",
"NotTuple": "La réponse doit être un n-uplet (un vecteur ligne).",
"NotPoly": "La réponse doit être un polynôme.",
"NotPhysical": "La réponse doit être une valeur numérique suivie d'une unité physique.",
"PhysicalNotNumeric": "La partie numérique doit être un nombre décimal.",
"WrongUnit": "Mauvaise unité.",
"RSetNotDisjoint": "Les ensembles de cette réunion ne sont pas disjoints. La réponse peut être simplifiée.",
"PolyNotExpanded": "La réponse doit être un polynôme développé.",
"PolyNotFactorized": "La réponse doit être un polynôme factorisé.",
"MatWrongSize": "La matrice n'a pas la bonne taille.",
"NotRatSimp": "L'expression peut encore être simplifiée.",
"Duplicates": "Il y a des doublons dans l'ensemble.",
"UnauthorizedFunc": "Votre réponse utilise des fonctions non-autorisées."
}

def add_feedback(eval):
    def eval_with_feedback(*args, **kwargs):
        if 'dictfeedback' in kwargs:
            feedback = {**_feedback_, **kwargs['dictfeedback']}
            kwargs.pop('dictfeedback')
        else:
            feedback = _feedback_
        score, error = eval(*args, **kwargs)
        if error in _feedback_:
            return score, error, feedback[error]
        else:
            return score, error, ""
    return eval_with_feedback

def eval_expr(strans, sol, checkratsimp=True, modulo=None, authorized_func=None, local_dict={}):
    r"""
    Evaluate an answer when the solution is an expression.
    
    >>> expr = sp.sympify("sqrt(2)/2", evaluate=False)
    >>> eval_expr(r"\frac{1}{\sqrt{2}}", expr)[1]
    'Success'
    
    >>> eval_expr(r"\frac{\sqrt{2}}{2}", expr)[1]
    'Success'
    
    >>> eval_expr(r"\sin(\pi/4)", expr)[1]
    'Success'
    
    >>> eval_expr(r"\sin(\pi/4)", expr, authorized_func={})[1]
    'UnauthorizedFunc'
    
    >>> eval_expr("e", sp.E)[1]
    'NotEqual'
    
    >>> eval_expr("\exp(1)", sp.E)[1]
    'Success'
    
    >>> eval_expr("\exp(1)", sp.E, local_dict={'e': sp.E})[1]
    'Success'
    """
    try:
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1, "NotExpr")
    if not isinstance(ans, sp.Expr):
        return (-1, "NotExpr")
    if authorized_func is not None and not func_in_expr(ans).issubset(authorized_func):
        return (-1, "UnauthorizedFunc")
    if not equal(ans, sol, modulo):
        return (0, "NotEqual")
    if checkratsimp and not is_rat_simp(ans):
        return (-1, "NotRatSimp")
    return (100, "Success")

def eval_mult_expr(lstans, lstsol, checkratsimp=True, modulo=None, authorized_func=None, local_dict={}):
    """
    Evaluate multiple answers.
    """
    lsterror = []
    lstscore = []
    for strans, sol in zip(lstans, lstsol):
        score, error = eval_expr(strans, sol, checkratsimp, modulo, authorized_func, local_dict)
        lsterror.append(error)
        lstscore.append(score)
    if "NotExpr" in lsterror:
        return (-1, "OneNotExpr")
    if "UnauthorizedFunc" in lsterror:
        return (-1, "OneUnauthorizedFunc")
    if "NotEqual" in lsterror:
        return (0, "NotEqual")
    if "NotRatSimp" in lsterror:
        return (-1, "NotRatSimp")
    return (100, "Success")

def eval_frac(strans, sol, simpwarning=True):
    """
    Evaluate an answer when the solution is a fraction.
    """
    try:
        ans = latex2sympy(strans)
    except:
        return (-1, "NotFrac")
    if not isinstance(ans, sp.Expr):
        return (-1, "NotFrac")
    if not is_frac_int(ans):
        return (-1, "NotFrac")
    if not equal(ans, sol):
        return (0, "NotEqual")
    if not is_frac_irred(ans):
        if simpwarning:
            return (-1, "NotFracIrred")
        else:
            return (0, "NotFracIrred")
    return (100, "Success")

def eval_function(strans, sol, checkratsimp=True, authorized_func=None, local_dict={}):
    r"""
    Evaluate an answer when the solution is a function.
    """
    local_dict.update({'e': sp.E})
    return eval_expr(strans, sol, checkratsimp, authorized_func, local_dict=local_dict)

@add_feedback
def eval_real_or_inf(strans, sol, local_dict={}):
    """
    Evaluate an answer when the solution is real or equal to infinity.
    """
    try:
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1, "NotRealOrInf")
    if not isinstance(ans, sp.Expr) or not is_real_or_inf(ans):
        return (-1, "NotRealOrInf")
    if not equal(ans, sol):
        return (0, "NotEqual")
    return (100, "Success")

def eval_complex(strans, sol, imaginary_unit="i", form="", checkratsimp=True, authorized_func={}, local_dict={}):
    """
    Evaluate an answer when the solution is a complex number.
    """
    local_dict.update({imaginary_unit: sp.I, 'e': sp.E})
    try:
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1, "NotCplx")
    if not isinstance(ans, sp.Expr) or not ans.is_complex:
        return (-1, "NotCplx")
    if authorized_func is not None and not func_in_expr(ans).issubset(authorized_func):
        return (-1, "UnauthorizedFunc")
    if not equal(ans, sol):
        return (0, "NotEqual")
    if form == "cartesian":
        if not is_complex_cartesian(ans):
            return (-1, "NotCplxCartesian")
        if checkratsimp and any(not is_rat_simp(part) for part in complex_cartesian_parts(ans)):
            return (-1, "NotRatSimp")
    if form == "exponential" and not is_complex_exponential(ans):
            return (-1, "NotCplxExponential")
    return (100, "Success")

def eval_poly(strans, sol, var='x', domain='R', form='', checkratsimp=True, imaginary_unit='i',  authorized_func={}, local_dict={}):
    """
    Evaluate an answer when the solution is a polynomial.
    
    >>> x = sp.Symbol('x')
    >>> P = (x + 1)**2
    
    >>> eval_poly("x^2 + 2x + 1", P, form="expanded")[1]
    'Success'
    
    >>> eval_poly("(x + 1)^2", P, form="factorized")[1]
    'Success'
    
    >>> eval_poly("(x + 1)^2", P, form="expanded")[1]
    'PolyNotExpanded'
    
    >>> eval_poly("x^2 + 2x + 1", P, form="factorized")[1]
    'PolyNotFactorized'
    """
    x = sp.Symbol(var)
    local_dict.update({imaginary_unit: sp.I, var: x})
    try:
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1, "NotPoly")
    if not isinstance(ans,sp.Expr) or not ans.is_polynomial(x):
        return (-1, "NotPoly")
    if form == "expanded" and not is_poly_expanded(ans ,x):
        return (-1, "PolyNotExpanded")
    elif form == "factorized" and not is_poly_factorized(ans, x, domain):
        return (-1, "PolyNotFactorized")
    if not equal(ans,sol):
        return (0, "NotEqual")
    if checkratsimp and not is_poly_ratsimp(ans, x):
        return (-1, "PolyNotRatSimp")
    return (100, "Success")

def eval_set(strans, sol, checkratsimp=True, wobracket=False, local_dict={}):
    """
    Evaluate an answer when the solution is a finite set.
    
    >>> A = FiniteSet(1, 3, 5)
    
    >>> eval_set("\{5,1,3\}", A)
    (100, 'Success')
    
    >>> eval_set("(5,1,3)", A)
    (-1, 'NotSet')
    
    >>> eval_set("\{5,1,3,1\}", A)
    (-1, 'Duplicates')
    
    >>> eval_set("\{5,3\}", A)
    (0, 'NotEqual')
    
    >>> eval_set("\{5,1,1+2\}", A)
    (-1, 'NotRatSimp')
    """
    sol = FiniteSet2struct(sol)
    try:
        if wobracket:
            strans = "\{ " + strans + " \}"
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1, "NotSet")
    if not isinstance(ans, list):
        return (-1, "NotSet")
    if duplicates(ans):
        return (-1, "Duplicates")
    if not equal_struct(ans, sol):
        return (0, "NotEqual")
    if checkratsimp and not is_rat_simp(ans):
        return (-1, "NotRatSimp")
    return (100, "Success")

def eval_set_complex(strans, sol, imaginary_unit="i", form="", checkratsimp=True, wobracket=False, local_dict={}):
    """
    Evaluate an answer when the solution is a finite set.
    """
    local_dict.update({imaginary_unit: sp.I, 'e': sp.E})
    sol = FiniteSet2struct(sol)
    try:
        if wobracket:
            strans = "\{ " + strans + " \}"
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1, "NotSet")
    if not isinstance(ans, list):
        return (-1, "NotSet")
    if duplicates(ans):
        return (-1, "Duplicates")
    if not equal_struct(ans, sol):
        return (0, "NotEqual")
    if checkratsimp and not is_rat_simp(ans):
        return (-1, "NotRatSimp")
    return (100, "Success")

def eval_tuple(strans, sol, checksize=False, local_dict={}):
    """
    Evaluate an answer when the solution is a tuple/vector.
    """
    sol = tuple(sol)
    try:
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1,"NotTuple")
    if not isinstance(ans,tuple):
        return (-1,"NotTuple")
    if checksize and len(ans) != len(sol):
        return (-1, "TupleWrongSize")
    if not equal_struct(ans,sol):
        return (0, "NotEqual")
    return (100, "Success")

def eval_chainineq(strans, sol, local_dict={}, authorized_func={}):
    """
    Analyze an answer expected to be chained inequalities.
    """
    try:
        ans = latex2chainineq(strans, local_dict)
    except:
        return (-1,"NotChainIneq")
    if not (equal(ans[0],sol[0]) and equal(ans[4],sol[4])):
        return (0,"WrongBounds")
    if not (ans[1]==sol[1] and ans[3]==sol[3]):
        return (0,"WrongIneq")
    return (100,"Success")

@add_feedback
def eval_matrix(matans, sol):
    """
    Evaluate an answer when the solution is a matrix.
    """
    try:
        ans = sp.Matrix(matans)
    except:
        return (-1, "NotMat")
    if ans.shape != sol.shape:
        return (0, "MatWrongSize")
    if not ans.equals(sol):
        return (0, "NotEqual")
    return (100, "Success")

def eval_rset(strans, sol):
    """
    Evaluate an answer when the solution is an union of intervals.
    """
    # TODO : handle empty set
    try:
        ans = latex2rset(strans)
        # simplification of endpoints is needed
        # otherwise, Sympy struggles to compare intervals
        # even with simplification, not sure comparison always works
        ans = simplify_rset(ans)
    except:
        return (-1, "NotRSet")
    if len(ans) > 1:
        for i in range(len(ans)):
            for j in range(i+1,len(ans)):
                if sp.Intersection(ans[i], ans[j]) != sp.EmptySet:
                    return (-1, "RSetNotDisjoint")
    if sp.Union(*ans) != sol:
        return (0, "NotEqual")
    return (100,"")

from sympy.physics.units import Quantity, convert_to

def get_numeric_unit(expr):
    """
    Return the numerical part and the unit of a physical quantity.
    """
    args = arg_nested_mul(expr)
    args_numeric = []
    args_quantity = []
    for a in args:
        if isinstance(a, sp.Pow):
            if isinstance(a.base, Quantity):
                args_quantity.append(a)
            else:
                args_numeric.append(a)
        elif isinstance(a, Quantity):
            args_quantity.append(a)
        else:
            args_numeric.append(a)
    return (sp.Mul(*args_numeric), sp.Mul(*args_quantity))

from sympy.physics.units.systems.si import dimsys_SI, SI

@add_feedback
def eval_physical(strans, sol, tol, local_dict={}):
    r"""
    Evaluate an answer when the solution is a physical quantity.
    """
    numsol, unitsol = get_numeric_unit(sol)
    dimsol = dimsys_SI.get_dimensional_dependencies(SI.get_dimensional_expr(unitsol))
    try:
        ans = latex2sympy(strans, local_dict)
        num, unit = get_numeric_unit(ans)
        dim = dimsys_SI.get_dimensional_dependencies(SI.get_dimensional_expr(unit))
    except:
        return (-1, "NotPhysical")
    if unit==1:
        return (-1, "NotPhysical")
    if not (num.is_Float or num.is_Integer):
        return (-1, "PhysicalNotNumeric")
    if dim != dimsol:
        return (0, "WrongUnit")
    num, unit = get_numeric_unit(convert_to(ans,unitsol))
    if not equal_approx(numsol, num, tol=tol):
        return (0, "NotEqual")
    return (100, "Success")

def ans_antiderivative(strans,sol,x,local_dict={}):
    """
    Analyze an answer of type expr.
    """
    x=sp.Symbol('x')
    test1=[(is_expr,-1,"NotExpr","Votre réponse n'est pas une expression valide.")]
    test2=[]
    test2.append((is_rat_simp,-1,"NotRatSimp","L'expression peut encore être simplifiée."))
    return ans_eqconstant_(strans,sol,x,local_dict,test1,test2)











