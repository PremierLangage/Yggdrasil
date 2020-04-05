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
    if diff.is_complex:
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
    """
    
    # search duplicates in lists
    if isinstance(p, list):
        if len(p) > 1:
            for i in range(len(p)):
                for j in range(i+1, len(p)):
                    if equal_struct(p[i], [j]):
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
    args = arg_nested_mul(expr)
    args.remove(x)
    if len(args)==0:
        return 0
    elif len(args)==1:
        return args[0]
    else:
        with sp.evaluate(False):
            return sp.Mul(*args)
    
def is_coeff_exponent(expr,x):
    """
    Check if an expression is of the form 'something times x power something'.
    """
    n=sp.degree(expr,x)
    if n==0:
        return True
    args=arg_nested_mul(expr)
    return args.count(x**n)==1 and sum([a.has(x) for a in args])==1

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
    """
    if isinstance(expr, sp.Expr):
        if sp.simplify(expr).is_rational:
            return is_frac_int_irred(expr)
        elif expr.is_Atom or expr.is_Boolean:
            return True
        else:
            return all(is_rat_simp(subexpr) for subexpr in expr.args)
    else:
        return True

def is_frac_int(expr):
    """
    Check if a sympy expression is a fraction of integers.
    """
    args=arg_nested_mul(expr)
    if len(args)>1 and sp.Integer(-1) in args:
        args.remove(sp.Integer(-1))
    with sp.evaluate(False):
        expr=sp.Mul(*args)
    f = sp.fraction(expr,exact=True)
    return f[0].is_Integer and f[1].is_Integer and f[1]!=0

def is_frac_irred(expr):
    """
    Check if a sympy fraction of integers is irreducible.
    """
    args=arg_nested_mul(expr)
    if len(args)>1 and sp.Integer(-1) in args:
        args.remove(sp.Integer(-1))
    with sp.evaluate(False):
        expr=sp.Mul(*args)
    f = sp.fraction(expr,exact=True)
    return sp.gcd(f[0],f[1])==1 and f[1]>0

def is_frac_int_irred(expr):
    """
    Check if a sympy expression is an irreducible fraction of integers.
    """
    return is_frac_int(expr) and is_frac_irred(expr)

def is_complex_cartesian(expr):
    """
    Check if a complex number is in cartesian form.
    """
    args = arg_nested_add(expr)
    ni = [is_coeff_mul(a, sp.I) for a in args].count(True)
    nr = [a.is_real for a in args].count(True)
    return ni <= 1 and ni+nr == len(args)

def complex_cartesian_parts(expr):
    """
    Return the real and imaginary parts.
    """
    args=arg_nested_add(expr)
    im=next(coeff_mul(a,sp.I) for a in args if is_coeff_mul(a,sp.I))
    lstre=[a for a in args if a.is_real]
    if len(lstre)==0:
        re=sp.Integer(0)
    elif len(lstre)==1:
        re=lstre[0]
    else:
        with sp.evaluate(False):
            re=sp.Add(*lstre)
    return (re,im)

def is_complex_cartesian_ratsimp(expr):
    """
    Return the real and imaginary parts.
    """
    (re,im)=complex_cartesian_parts(expr)
    return is_rat_simp(re) and is_rat_simp(im)

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

def is_poly_expanded(expr,x):
    """
    Check if a polynomial is in expanded form.
    """
    args=arg_nested_add(expr)
    return all(is_coeff_exponent(a,x) for a in args)

def is_poly_factorized(expr,x,domain):
    """
    Check if a polynomial is factorized.
    """
    args=arg_nested_mul(expr)
    for a in args:
        if type(a)==sp.Pow:
            a=a.args[0]
        if not sp.Poly(a,x,domain=domain).is_irreducible:
            return False
    return True

def only_authorized_func(expr,authorized_func):
    nonauthorized_func=set([type(a) for a in expr.atoms(sp.Function)]).difference(authorized_func)
    return nonauthorized_func==set()


# Answer evaluation functions

_feedback_ = {
"Success": "",
"NotEqual": "",
"NotExpr": "La réponse doit être une expression mathématique.",
"NotRealOrInf": "La réponse doit être un nombre réel ou +$\infty$ ou $-\infty$.",
"NotCplx": "La réponse doit être un nombre complexe.",
"NotCplxCartesian": "La réponse doit être un nombre complexe sous forme cartésienne.",
"NotCplxExponential": "La réponse doit être un nombre complexe sous forme exponentielle.",
"NotSet": "La réponse doit être un ensemble.",
"NotPoly": "La réponse doit être un polynôme.",
"PolyNotExpanded": "La réponse doit être un polynôme développé.",
"PolyNotFactorized": "La réponse doit être un polynôme factorisé.",
"MatWrongSize": "La matrice n'a pas la bonne taille.",
"NotRatSimp": "L'expression peut encore être simplifiée.",
"Duplicates": "Il y a des doublons dans l'ensemble.",
"UnauthorizedFunc": "Votre réponse utilise des fonctions non-autorisées."
}

def add_feedback(eval):
    def eval_with_feedback(*args, **kwargs):
        score, error = eval(*args, **kwargs)
        if error in _feedback_:
            return score, error, _feedback_[error]
        else:
            return score, error, ""
    return eval_with_feedback

@add_feedback
def eval_expr(strans, sol, checkratsimp=True, local_dict={}):
    """
    Evaluate an answer when the solution is an expression.
    """
    try:
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1, "NotExpr")
    if not isinstance(ans, sp.Expr):
        return (-1, "NotExpr")
    if not equal(ans, sol):
        return (0, "NotEqual")
    #if checkratsimp and not is_rat_simp(expr):
    #    return (-1, "NotRatSimp")
    return (100, "Success")
    
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

@add_feedback
def eval_complex(strans, sol, imaginary_unit="i", form="", authorized_func={}, local_dict={}):
    """
    Evaluate an answer when the solution is a complex number.
    """
    local_dict.update({imaginary_unit: sp.I, 'e': sp.E})
    try:
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1, "NotCplx")
    if not isinstance(ans,sp.Expr) or not ans.is_complex:
        return (-1, "NotCplx")
    if not only_authorized_func(ans, authorized_func):
        return (-1, "UnauthorizedFunc")
    if not equal(ans, sol):
        return (0, "NotEqual")
    if form == "cartesian" and not is_complex_cartesian(ans):
            return (-1, "NotCplxCartesian")
    # is_complex_cartesian_ratsimp,-1,"NotRatSimp","L'expression peut encore être simplifiée."
    if form == "exponential" and not is_complex_exponential(ans):
            return (-1, "NotCplxExponential")
    return (100, "Success")

@add_feedback
def eval_poly(strans, sol, x, domain="RR", imaginary_unit="i", form="", authorized_func={}, local_dict={}):
    """
    Evaluate an answer when the solution is a polynomial.
    """
    local_dict.update({imaginary_unit: sp.I})
    try:
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1, "NotPoly")
    if not isinstance(ans,sp.Expr) or not ans.is_polynomial(x):
        return (-1, "NotPoly")
    if not only_authorized_func(ans,authorized_func):
        return (-1,"UnauthorizedFunc")
    if not equal(ans,sol):
        return (0, "NotEqual")
    if form == "expanded" and not is_poly_expanded(expr,x):
            return (-1, "PolyNotExpanded")
    if form == "factorized" and not is_poly_factorized(expr,x,domain):
            return (-1, "PolyNotFactorized")
    return (100, "Success")

@add_feedback
def eval_set(strans, sol, local_dict={}):
    """
    Evaluate an answer when the solution is a finite set.
    """
    sol = FiniteSet2struct(sol)
    try:
        ans = latex2sympy(strans, local_dict)
    except:
        return (-1, "NotSet")
    if not isinstance(ans, list):
        return (-1, "NotSet")
    if duplicates(ans):
        return (-1, "Duplicates")
    if not equal_struct(ans, sol):
        return (0, "NotEqual")
    return (100, "Success")

@add_feedback
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

def ans_antiderivative(strans,sol,x,local_dict={}):
    """
    Analyze an answer of type expr.
    """
    x=sp.Symbol('x')
    test1=[(is_expr,-1,"NotExpr","Votre réponse n'est pas une expression valide.")]
    test2=[]
    test2.append((is_rat_simp,-1,"NotRatSimp","L'expression peut encore être simplifiée."))
    return ans_eqconstant_(strans,sol,x,local_dict,test1,test2)
