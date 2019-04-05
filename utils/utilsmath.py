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
    s=s.replace('\\',"")
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
    lst=[]
    for a in expr.args:
        if a.is_Add:
            lst=lst+arg_add_denest(a)
        else:
            lst.append(a)
    return lst
     
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
        if not is_frac(ans):
            score=-1
            numerror=3
            texterror="Votre réponse n'est pas une fraction d'entiers ou un entier."
        elif not is_frac_irred(ans):
            score=0
            numerror=2
            texterror="Votre réponse n'est pas une fraction irréductible."
        elif not is_equal(ans,sol):
            score=0
            numerror=1
            texterror=""
        else:
            score=100
            numerror=0
            texterror=""
    except:
        score=-1
        numerror=3
        texterror="Votre réponse n'est pas une fraction d'entiers ou un entier."
    return score,numerror,texterror

# Complex numbers

def ans_complex(strans,sol,imaginary_unit):
    """
    Analyze an answer of type number
    """
    try:
        ans=str2expr(strans,{imaginary_unit:sp.I})
        if not ans.is_complex:
            score=-1
            numerror=2
            texterror="Votre réponse n'est pas un nombre complexe valide."
        elif not is_equal(ans,sol):
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
        texterror="Votre réponse n'est pas un nombre complexe valide."
    return score,numerror,texterror

def is_complex_cartesian(expr):
    """
    Check if a complex number is in cartesian form.
    """
    args=arg_add_flatten(expr)
    nre=sum(a.is_real for a in args)        
    nim=sum(a.is_imaginary for a in args)
    m=len(args)-nre-nim
    return (nre<=1) and (nim<=1) and (m==0)
    
def ans_complex_cartesian(strans,sol,imaginary_unit):
    """
    Analyze an answer of type complex
    """
    try:
        ans=str2expr(strans,{imaginary_unit:sp.I})
        if not ans.is_complex:
            score=-1
            numerror=2
            texterror="Votre réponse n'est pas un nombre complexe valide."
        elif not is_complex_cartesian(ans):
            score=-1
            numerror=3
            texterror="Votre réponse n'est pas sous forme cartésienne."
        elif not is_equal(ans,sol):
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
        texterror="Votre réponse n'est pas un nombre complexe valide."
    return score,numerror,texterror

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

