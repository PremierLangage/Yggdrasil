from plrandom import rd
import sympy as sp
import sympy.parsing.sympy_parser as prs
from sympy.printing.latex import LatexPrinter as LatexPrinter0
import re
from sympy.core.compatibility import default_sort_key

#############################################################################
# Latex printing
#############################################################################

class CustomLatexPrinter(LatexPrinter0):
    printmethod = "" # prevent the printer to use latex printing methods defined in classes
    
    _default_settings = {
        "order": None,
        "mode": "plain",
        "itex": False,
        "fold_frac_powers": False,
        "fold_func_brackets": False,
        "fold_short_frac": None,
        "long_frac_ratio": None,
        "mul_symbol": None,
        "inv_trig_style": "abbreviated",
        "mat_str": "pmatrix",
        "mat_delim": "[",
        "symbol_names": {},
        "ln_notation": True,
        "interv_rev_brack": True,
        "imaginary_unit": "i",
    }
    
    def _print_Pi(self, expr):
        return r"\pi"
    
    def _print_ImaginaryUnit(self, expr):
        return self._settings["imaginary_unit"]

    def _print_Interval(self, i):
        
        if i.start == i.end:
            return r"\left\{%s\right\}" % self._print(i.start)
            
        else:
            if i.left_open:
                if self._settings["interv_rev_brack"]:
                    left = ']'
                else:
                    left = '('
            else:
                left = '['
    
            if i.right_open:
                if self._settings["interv_rev_brack"]:
                    right = '['
                else:
                    right = ')'
            else:
                right = ']'
    
            return r"\left%s%s, %s\right%s" % \
                    (left, self._print(i.start), self._print(i.end), right)

    def _print_set(self, s):
        items = sorted(s, key=default_sort_key)
        items = ", ".join(map(self._print, items))
        return r"\\left\\{%s\\right\\}" % items

    def _print_MatrixBase(self, expr):
        lines = []

        for line in range(expr.rows):  # horrible, should be 'rows'
            lines.append(" & ".join([ self._print(i) for i in expr[line, :] ]))

        mat_str = self._settings['mat_str']
        if mat_str is None:
            if self._settings['mode'] == 'inline':
                mat_str = 'smallmatrix'
            else:
                if (expr.cols <= 10) is True:
                    mat_str = 'matrix'
                else:
                    mat_str = 'array'

        out_str = r'\begin{%MATSTR%}%s\end{%MATSTR%}'
        out_str = out_str.replace('%MATSTR%', mat_str)
        if mat_str == 'array':
            out_str = out_str.replace('%s', '{' + 'c'*expr.cols + '}%s')
        return out_str % r"\\\\".join(lines)

LatexPrinter=CustomLatexPrinter()

def latex(expr):
    return LatexPrinter.doprint(expr)

#############################################################################
# Latex parsing
#############################################################################

def str2expr(s,local_dict={}):
    """
    Convert a latex string into a mathematical expression.

    >>> str2expr("x+3+2x")
    x + 2*x + 3
    
    >>> str2expr("2^3")
    2**3
    
    >>> str2expr("sin 2pi")
    sin(2*pi)
    
    >>> str2expr("3!")
    factorial(3)
    """

    pattern = re.compile(r'\\frac\s*{(.*)}{(.*)}')
    s = pattern.sub(r"(\1)/(\2)", s)
    s=s.replace("\\times", "*")
    s=s.replace("\left", "")
    s=s.replace("\right", "")
    s=s.replace('\\'," ")
    s=s.replace("{", "(")
    s=s.replace("}", ")")
    
    transformations=prs.standard_transformations + (prs.implicit_multiplication_application,prs.convert_xor)
    with sp.evaluate(False):
        return prs.parse_expr(s,local_dict=local_dict,transformations=transformations,evaluate=False)

def str2finiteset(s,local_dict={}):
    """
    Convert a latex string into a finite set.
    """
    s=s.strip()
    if s=="\\emptyset":
        return EmptySet()
    pattern = re.compile(r'^\\{(.*)\\}$')
    if pattern.match(s) is not None:
        elements=str2expr(pattern.match(s).group(1))
        if type(elements)==tuple:
            return sp.FiniteSet(*elements)
        else:
            return sp.FiniteSet(elements)

def str2interval(s,local_dict={}):
    """
    Convert a latex string into an interval.
    """
    s=s.strip()
    s=s.replace("\emptyset", "EmptySet()")
    s=s.replace("\R", "S.Reals")
    s=s.replace("\infty", "oo")
    pattern = re.compile(r'\\{(.*)\\}')
    if pattern.search(s) is not None:
        return sp.FiniteSet(str2expr(pattern.search(s).group(1)))
    pattern = re.compile(r'\\lbrack(.*),(.*)\\rbrack')
    if pattern.search(s) is not None:
        return sp.Interval(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))
    pattern = re.compile(r'\\lbrack(.*),(.*)\\lbrack')
    if pattern.search(s) is not None:
        return sp.Interval.Ropen(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))
    pattern = re.compile(r'\\rbrack(.*),(.*)\\rbrack')
    if pattern.search(s) is not None:
        return sp.Interval.Lopen(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))
    pattern = re.compile(r'\\rbrack(.*),(.*)\\lbrack')
    if pattern.search(s) is not None:
        return sp.Interval.open(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))


#############################################################################
# Generation of random mathematical objects
#############################################################################

# Items from a list

def randitem(items,excluded_values=[]):
    """
    Pick a random item from a list.
    """
    item=rd.choice(items)
    while item in excluded_values:
        item=rd.choice(items)
    return item

def _list_rand0(n,items,replace,excluded_values):
    """
    Generate a list of random items selected from a list.
    """
    if replace==True:
        lst=[]
        while len(lst)<n:
            item=rd.choice(items)
            if item not in excluded_values:
                lst.append(item)
    elif replace==False:
        m=len(excluded_values)
        lst=rd.sample(items,n+m)
        if m>0:
            lst=[x for x in lst if x not in excluded_values]
            lst=lst[0:n]
    else:
        raise ValueError
    return lst
    
def list_randitem(n,items,excluded_values=[]):
    """
    Generate a list of random items selected from a list with replacements.
    """
    return _list_rand0(n,items,True,excluded_values)

def list_randitem_norep(n,items,excluded_values=[]):
    """
    Generate a list of random items selected from a list without replacements.
    """
    return _list_rand0(n,items,False,excluded_values)

# Integers

def randint(a,b,excluded_values=[]):
    """
    Pick a random integer.
    """
    item=rd.choice(range(a,b+1))
    while item in excluded_values:
        item=rd.choice(range(a,b+1))
    return item

def list_randint(n,a,b,excluded_values=[]):
    """
    Generate a list of random integers with replacements.
    """
    return _list_rand0(n,range(a,b+1),True,excluded_values)

def list_randint_norep(n,a,b,excluded_values=[]):
    """
    Generate a list of random integers without replacements.
    """
    return _list_rand0(n,range(a,b+1),False,excluded_values)

# Complex numbers

def rand_complex_int(bound):
    """
    Generate a random complex number with integer coefficients.
    """
    a,b=list_randint(2,-bound,bound,[0])
    return sp.sympify(a+b*sp.I)

# Finite sets

def rand_finiteset(n,items,excluded_values=[]):
    """
    Generate a random finite set.
    """
    return sp.FiniteSet(*list_randitem_norep(n,items,excluded_values=[]))

# Intervals

def rand_interval_type(a,b):
    """
    Generate an interval with random type of bounds.
    """
    bl=rd.choice([True,False])
    br=rd.choice([True,False])
    return sp.Interval(a,b,left_open=bl,right_open=br)

# Matrices

def rand_int_matrix(n,p,bound):
    """
    Generate a random matrix with integer entries.
    """
    entries=list_randint(n*p,-bound,bound)
    return sp.Matrix(n,p,entries)

def rand_int_matrix_invertible(n,bound):
    """
    Generate an invertible random matrix with integer entries.
    """
    while True:
        M=rand_int_matrix(n,n,bound)
        if M.det()!=0:
            return M

def rand_int_matrix_givenrank(n,r):
    """
    Generate a nxn random matrix with given rank.
    """
    A=sp.zeros(n)
    d=list_randint_norep(r,0,n-1)
    for i in range(r):
        A[d[i],d[i]]=1
    while True:
        P=rand_int_matrix_invertible(n,2)
        Q=rand_int_matrix_invertible(n,2)
        B=P*A*Q
        numzeros=0
        for i in range(n):
            for j in range(n):
                if B[i,j]==0:
                    numzeros += 1
        diffrows=len(set([tuple(B.row(i)) for i in range(n)]))
        diffcols=len(set([tuple(B.col(i)) for i in range(n)]))
        if numzeros < n and diffcols==n and diffrows==n:
            return P*A*Q


#############################################################################
# Answer analysis
#############################################################################

# Utils

def arg_add_flatten(expr):
    if not expr.is_Add:
        return [expr]
    lst=[]
    for a in expr.args:
        if a.is_Add:
            lst=lst+arg_add_flatten(a)
        else:
            lst.append(a)
    return lst
    
def arg_mul_flatten(expr):
    if not expr.is_Mul:
        return [expr]
    lst=[]
    for a in expr.args:
        if a.is_Mul:
            lst=lst+arg_mul_flatten(a)
        else:
            lst.append(a)
    return lst

def mul_flatten(expr):
    if not expr.is_Mul:
        return expr
    lst=[]
    for a in expr.args:
        if a.is_Mul:
            lst=lst+arg_mul_flatten(a)
        else:
            lst.append(a)
    return sp.Mul(*lst)
    
def is_rat_coeff_mul(expr,x):
    """
    Check if a sympy expression is a monomial.
    """
    args=arg_mul_flatten(expr)
    try:
        args.remove(x)
        args.remove(sp.Integer(-1))
    except:
        pass
    if len(args)==0:
        return True
    if len(args)==1:
        if isinstance(args[0],(sp.Integer,int,sp.Rational)):return True
        if isinstance(args[0],sp.Pow) and isinstance(args[0].args[0],sp.Integer) and args[0].args[1]==sp.Integer(-1):return True
    if len(args)==2:
        if not isinstance(args[0],sp.Integer):
            args=[args[1],args[0]]
        if isinstance(args[0],sp.Integer) and isinstance(args[1],sp.Pow):
            args1=args[1].args
            if isinstance(args1[0],sp.Integer) and args1[1]==sp.Integer(-1):
                return sp.gcd(args[0],args1[0])==1
    return False

def is_rat_coeff_exponent(expr,x):
    """
    Check if a sympy expression is a monomial.
    """
    c,d = expr.as_coeff_exponent(x)
    if d<=1: return is_rat_coeff_mul(expr,x)
    if d>1: return is_rat_coeff_mul(expr,x**d)
    return False
     
def is_equal(a, b):
    """
    Check if two sympy expressions are equal after simplifications.
    """
    return sp.simplify(a-b) == 0

def ans_prod(strans,solargs):
    """
    Analyze an answer of type...
    """
    try:
        ans=str2finiteset(strans)
        if type(ans)==sp.Mul and set(solargs)==set(ans.args):
            numeror=0
            score=100
        else:
            numeror=1
            score=0
    except:
        score=-1
        numerror=2
        texterror="Votre réponse n'est pas une expression mathématique valide."
    return score,numerror,texterror

# Numbers

def is_algebraic(expr):
    """
    Check if a sympy expression is in algebraic form.
    """
    return expr.atoms(sp.Function)==set()

def ans_algebraic(strans,sol):
    """
    Analyze an answer of type number.
    """
    try:
        ans=str2expr(strans)
    except:
        return (-1,3,"Votre réponse n'est pas une expression mathématique valide.")
    if not is_algebraic(ans):
        return (-1,3,"Votre réponse n'est pas écrite correctement.")
    if is_equal(ans,sol):
        return (100,0,"")
    return (0,1,"")


def ans_number(strans,sol):
    """
    Analyze an answer of type number.
    """
    try:
        ans=str2expr(strans)
        if not ans.is_Number:
            score=-1
            numerror=2
            texterror="Votre réponse n'est pas un nombre valide."
        elif ans!=sol:
            score=0
            numerror=1
            texterror=""
        else:
            score=100
            numerror=0
            texterror=""
    except:
        score=-1
        numerror=2
        texterror="Votre réponse n'est pas un nombre valide."
    return score,numerror,texterror

# Fractions

def is_frac(expr):
    """
    Check if a sympy expression is a fraction of integers.
    """
    f = sp.fraction(expr)
    return f[0].is_Integer and f[1].is_Integer and f[1]!=0

def is_frac_irred(expr):
    """
    Check if a sympy fraction of integers is irreducible.
    """
    f = sp.fraction(expr)
    return sp.gcd(f[0],f[1])==1 and f[1]>0
    
def ans_frac(strans,sol):
    """
    Analyze an answer of type fraction.
    """
    try:
        ans=str2expr(strans)
    except:
        return (-1,3,"Votre réponse n'est pas une fraction d'entiers ou un entier.")
    if not is_frac(ans):
        return (-1,3,"Votre réponse n'est pas une fraction d'entiers ou un entier.")
    if not is_frac_irred(ans):
        return (0,2,"Votre réponse n'est pas une fraction irréductible.")
    if not is_equal(ans,sol):
        return (0,1,"")
    return (100,0,"")


# Complex numbers

def ans_complex(strans,imaginary_unit,sol):
    """
    Analyze an answer of type complex number.
    """
    try:
        ans=str2expr(strans,{imaginary_unit:sp.I})
    except:
        return (-1,2,"Votre réponse n'est pas un nombre complexe valide.")
    if not ans.is_complex:
        return (-1,2,"Votre réponse n'est pas un nombre complexe valide.")
    if not is_equal(ans,sol):
        return (0,1,"")
    return (100,0,"")

def is_complex_algebraic(expr):
    """
    Check if a complex number is in algebraic form.
    """
    if not expr.is_polynomial(sp.I):
        return False
    args=arg_add_flatten(expr)
    fact = [a.as_independent(sp.I)[1] for a in args]
    return fact.count(sp.I)<=1 and fact.count(sp.I)+fact.count(1)==len(fact)

def ans_complex_algebraic(strans,imaginary_unit,sol):
    """
    Analyze an answer of type complex number in algebraic form.
    """
    try:
        ans=str2expr(strans,{imaginary_unit:sp.I})
    except:
        return (-1,2,"Votre réponse n'est pas un nombre complexe valide.")
    if not ans.is_complex:
        return (-1,2,"Votre réponse n'est pas un nombre complexe valide.")
    if not is_complex_algebraic(ans):
        return (-1,3,"Votre réponse n'est pas un nombre complexe écrit sous forme cartésienne.")
    if not is_equal(ans,sol):
        return (0,1,"")
    return (100,0,"")
    
def ans_complex_cartesian_coeff_rat(strans,imaginary_unit,sol):
    """
    Analyze an answer of type complex number in algebraic form with rational coefficients.
    """
    try:
        ans=str2expr(strans,{imaginary_unit:sp.I,'e':sp.E})
    except:
        return (-1,2,"Votre réponse n'est pas un nombre complexe valide.")
    if not ans.is_complex:
        return (-1,2,"Votre réponse n'est pas un nombre complexe valide.")
    if not is_complex_algebraic(ans):
        return (-1,3,"Votre réponse n'est pas un nombre complexe écrit sous forme cartésienne.")
    args=arg_add_flatten(ans)
    fact = [sp.collect(a,sp.I).as_coeff_Mul(sp.I)[1] for a in args]
    if fact.count(1)>1 or not all(is_rat_coeff_mul(a,sp.I) for a in args):
        return (-1,3,"La partie réelle et/ou la partie imaginaire de votre réponse n'est pas simplifiée.")
    if not is_equal(ans,sol):
        return (0,1,"")
    return (100,0,"")
    
def ans_complex_cartesian_coeff_rad(strans,imaginary_unit,sol):
    """
    Analyze an answer of type complex number in algebraic form with rational coefficients.
    """
    try:
        ans=str2expr(strans,{imaginary_unit:sp.I,'e':sp.E})
    except:
        return (-1,2,"Votre réponse n'est pas un nombre complexe valide.")
    if not ans.is_complex:
        return (-1,2,"Votre réponse n'est pas un nombre complexe valide.")
    if not is_complex_algebraic(ans):
        return (-1,3,"Votre réponse n'est pas un nombre complexe écrit sous forme cartésienne.")
    args=arg_add_flatten(ans)
    coeff = [mul_flatten(a).as_coeff_Mul(sp.I)[0] for a in args]
    if not all(a.atoms(sp.Function)==set() for a in args):
        return (-1,3,"La partie réelle et/ou la partie imaginaire utilise des fonctions.")
    if not is_equal(ans,sol):
        return (0,1,"")
    return (100,0,"")
  

# Finite sets

def ans_finiteset(strans,sol):
    """
    Analyze an answer of type finite set.
    """
    try:
        ans=str2finiteset(strans)
        if ans!=sol:
            score=0
            numerror=1
            texterror=""
        else:
            score=100
            numerror=0
            texterror=""
    except:
        score=-1
        numerror=2
        texterror="Votre réponse n'est pas un ensemble valide."
    return score,numerror,texterror

# Intervals

def ans_interval(strans,sol):
    """
    Analyze an answer of type interval.
    """
    try:
        ans=str2interval(strans)
        if ans!=sol:
            score=0
            numerror=1
            texterror=""
        else:
            score=100
            numerror=0
            texterror=""
    except:
        score=-1
        numerror=2
        texterror="Votre réponse n'est pas un ensemble valide."
    return score,numerror,texterror

# Polynomials

def is_poly_expanded(expr,x):
    """
    Check if a sympy polynomial is written in expanded form.
    """
    args=arg_add_flatten(expr)
    coeff = [a.as_coeff_exponent(x)[0] for a in args]
    return all(not c.has(x) for c in coeff)

def is_poly_reduced(expr,x):
    """
    Check if a sympy polynomial is written in reduced form.
    """
    args=arg_add_flatten(expr)
    degrees0 = [a.as_coeff_exponent(x)[1] for a in args if a.as_coeff_exponent(x)[1]!=0]
    return len(degrees0)==len(set(degrees0))

def ans_poly_expanded(strans,x,sol):
    try:
        ans=str2expr(strans)
    except:
        return (-1,3,"Votre réponse n'est pas un polynôme.")
    if not is_poly_expanded(ans,x):
        return (-1,3,"Votre réponse n'est pas développée.")
    if not is_poly_reduced(ans,x):
        return (-1,3,"Votre réponse n'est pas réduite.")
    return (100,0,"")
    
def ans_poly_expanded_rat(strans,x,sol):
    try:
        ans=str2expr(strans)
    except:
        return (-1,3,"Votre réponse n'est pas un polynôme.")
    if not is_poly_expanded(ans,x):
        return (-1,3,"Votre réponse n'est pas développée.")
    if not is_poly_reduced(ans,x):
        return (-1,3,"Votre réponse n'est pas réduite.")
    args=arg_add_flatten(ans)
    degrees = [a.as_coeff_exponent(x)[1] for a in args]
    if degrees.count(0)>1 or not all(is_rat_coeff_exponent(a,x) for a in args):
        return (-1,3,"Un ou plusieurs coefficients ne sont simplifiés.")
    if not is_equal(ans,sol):
        return (0,1,"")
    return (100,0,"")

def is_poly_factor(expr,x):
    """
    Check if a sympy polynomial is factorized.
    """
    args=arg_mul_flatten(expr)
    for a in args:
        if not sp.Poly(a,x).is_irreducible:
            return False
    return True

def ans_poly_factor(strans,x,sol):
    try:
        ans=str2expr(strans)
    except:
        return (-1,3,"Votre réponse n'est pas un polynôme.")
    if not is_poly_factor(ans,x):
        return (-1,3,"Votre réponse n'est pas factorisée.")
    if is_equal(ans,sol):
        return (100,0,"")
    return (0,1,"")


