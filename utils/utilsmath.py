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
        "root_notation": True,
        "interv_rev_brack": True,
        "imaginary_unit": "i",
    }
    
    def _print_Pi(self, expr):
        return r"\pi"

    def _print_Infinity(self, expr):
        return r"+\infty"

    def _print_NegativeInfinity(self, expr):
        return r"-\infty"
    
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

def latexsys(A,B):
    n=A.shape[0]
    lstvar=['x','y','z','t','u','v','w']
    X=list(map(sp.symbols,lstvar[0:n]))
    lhs=A*sp.Matrix(X)
    code="\\left\lbrace \\\\begin{align}"
    for i in range(n-1):
        code+="&" + latex(sp.Eq(lhs[i],B[i]))+" \\\\\\ "
    code+="&" +latex(sp.Eq(lhs[n-1],B[n-1]))+ " \\\\end{align}\\right."
    return code

def latex_ineq(lst):
    expr1,rel1,expr,rel2,expr2=lst
    rel1=rel1.replace("<=",r"\le")
    rel1=rel1.replace(">=",r"\ge")
    rel2=rel2.replace("<=",r"\le")
    rel2=rel2.replace(">=",r"\ge")
    return latex(expr1)+rel1+" "+latex(expr)+rel2+" "+latex(expr2)

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
    s=s.replace(r"\mleft", "")
    s=s.replace(r"\mright", "")
    s=s.replace(r"\left", "")
    s=s.replace(r"\right", "")
    pattern = re.compile(r'\\frac\s*{(.*)}{(.*)}')
    s = pattern.sub(r"(\1)/(\2)", s)
    s=s.replace("\\times", "*")
    s=s.replace('\\'," ")
    s=s.replace("{", "(")
    s=s.replace("}", ")")
    
    transformations=prs.standard_transformations + (prs.implicit_multiplication_application,prs.convert_xor)
    with sp.evaluate(False):
        return prs.parse_expr(s,local_dict=local_dict,transformations=transformations,evaluate=False)

def str2listexpr(s,delim='',local_dict={}):
    """
    Convert a latex string into a list of expressions
    """
    s=s.replace(r"\mleft","")
    s=s.replace(r"\mright","")
    s=s.replace(r"\left","")
    s=s.replace(r"\right","")
    s=s.replace(r"\{",r"{")
    s=s.replace(r"\}",r"}")
    s=s.replace(r"\lbrace",r"{")
    s=s.replace(r"\rbrace",r"}")
    s=s.strip()
    if delim=="":
        pattern = re.compile(r'^(.*)$')
    if delim=="{":
        pattern = re.compile(r'^{(.*)}$')
    if delim=="(":
        pattern = re.compile(r'^\((.*)\)$')
    inside=str2expr(pattern.match(s).group(1))
    if inside is not None:
        if isinstance(inside,tuple):
            return inside
        else:
            return [inside]

def str2realset(s,local_dict={}):
    """
    Convert a latex string into an interval.
    """
    s=s.strip()
    if s==r"\emptyset":
        return [sp.EmptySet()]
    if s==r"\R":
        return [sp.S.Reals]
    subsets = s.split("\cup")
    return [str2interval(a,local_dict) for a in subsets]


def str2interval(s,local_dict={}):
    """
    Convert a latex string into an interval.
    """
    s=s.strip()
    s=s.replace("\infty", "oo")
    s=s.replace(r"\mleft","")
    s=s.replace(r"\mright","")
    s=s.replace(r"\left","")
    s=s.replace(r"\right","")
    s=s.replace(r"\{",r"{")
    s=s.replace(r"\}",r"}")
    s=s.replace(r"\lbrace",r"{")
    s=s.replace(r"\rbrace",r"}")
    pattern = re.compile(r'^{(.*)}$')
    if pattern.search(s) is not None:
        return sp.FiniteSet(str2expr(pattern.search(s).group(1)))
    pattern = re.compile(r'^\\lbrack(.*),(.*)\\rbrack$')
    if pattern.search(s) is not None:
        return sp.Interval(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))
    pattern = re.compile(r'^\\lbrack(.*),(.*)\\lbrack$')
    if pattern.search(s) is not None:
        return sp.Interval.Ropen(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))
    pattern = re.compile(r'^\\rbrack(.*),(.*)\\rbrack$')
    if pattern.search(s) is not None:
        return sp.Interval.Lopen(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))
    pattern = re.compile(r'^\\rbrack(.*),(.*)\\lbrack$')
    if pattern.search(s) is not None:
        return sp.Interval.open(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))
    raise ValueError()

def str2chainineq(s,local_dict={}):
    """
    Convert a latex string into chained inequalities.
    """
    s=s.strip()
    s=s.replace(r"\mleft","")
    s=s.replace(r"\mright","")
    s=s.replace(r"\left","")
    s=s.replace(r"\ge",">=")
    s=s.replace(r"\geq",">=")
    s=s.replace(r"\le","<=")
    s=s.replace(r"\leq","<=")
    pattern = re.compile(r'^(.*)<=(.*)<=(.*)$')
    if pattern.search(s) is not None:
        parts=[pattern.search(s).group(1),'<=',pattern.search(s).group(2),'<=',pattern.search(s).group(3)]
    pattern = re.compile(r'^(.*)<(.*)<=(.*)$')
    if pattern.search(s) is not None:
        parts=[pattern.search(s).group(1),'<',pattern.search(s).group(2),'<=',pattern.search(s).group(3)]
    pattern = re.compile(r'^(.*)<=(.*)<(.*)$')
    if pattern.search(s) is not None:
        parts=[pattern.search(s).group(1),'<=',pattern.search(s).group(2),'<',pattern.search(s).group(3)]
    pattern = re.compile(r'^(.*)<(.*)<(.*)$')
    if pattern.search(s) is not None:
        parts=[pattern.search(s).group(1),'<',pattern.search(s).group(2),'<',pattern.search(s).group(3)]
    pattern = re.compile(r'^(.*)>=(.*)>=(.*)$')
    if pattern.search(s) is not None:
        parts=[pattern.search(s).group(3),'<=',pattern.search(s).group(2),'<=',pattern.search(s).group(1)]
    pattern = re.compile(r'^(.*)>=(.*)>(.*)$')
    if pattern.search(s) is not None:
        parts=[pattern.search(s).group(3),'<',pattern.search(s).group(2),'<=',pattern.search(s).group(1)]
    pattern = re.compile(r'^(.*)>(.*)>=(.*)$')
    if pattern.search(s) is not None:
        parts=[pattern.search(s).group(3),'<=',pattern.search(s).group(2),'<',pattern.search(s).group(1)]
    pattern = re.compile(r'^(.*)>(.*)>(.*)$')
    if pattern.search(s) is not None:
        parts=[pattern.search(s).group(3),'<',pattern.search(s).group(2),'<',pattern.search(s).group(1)]
    return [str2expr(parts[0]),parts[1],str2expr(parts[2]),parts[3],str2expr(parts[4])]

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

# Polynomials

def rand_int_poly(d,nc,bound,x):
    """
    Generate a random polynomial with integer coefficients.
    """
    c=list_randint(nc,-bound,bound,[0])
    p=[d]+list_randint_norep(nc-1,0,d-1)
    return sum([c[i]*x**p[i] for i in range(nc)])

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
    
def is_coeff_mul(expr,x):
    args=arg_mul_flatten(expr)
    return args.count(x)==1 and sum([a.has(x) for a in args])==1

def coeff_mul(expr,x):
    args=arg_mul_flatten(expr)
    args.remove(x)
    if len(args)==0:
        return 0
    elif len(args)==1:
        return args[0]
    else:
        with sp.evaluate(False):
            return sp.Mul(*args)

def is_coeff_exponent(expr,x):
    n=sp.degree(expr,x)
    if n==0:
        return True
    args=arg_mul_flatten(expr)
    return args.count(x**n)==1 and sum([a.has(x) for a in args])==1

def coeff_exponent(expr,x):
    n=sp.degree(expr,x)
    args=arg_mul_flatten(expr)
    args.remove(x**n)
    if len(args)==0:
        return 0
    elif len(args)==1:
        return args[0]
    else:
        with sp.evaluate(False):
            return sp.Mul(*args)


def mul_flatten(expr):
    if not expr.is_Mul:
        return expr
    lst=[]
    for a in expr.args:
        if a.is_Mul:
            lst=lst+arg_mul_flatten(a)
        else:
            lst.append(a)
    with sp.evaluate(False):
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
    if a==b:
        return True
    return sp.simplify(a-b) == 0

def is_rat_simp(expr):
    """
    Check if the rational numbers in a sympy expressions are simplified.
    """
    if expr.is_rational:
        return is_frac_int_irred(expr)
    else:
        return all(is_rat_simp(subexpr) for subexpr in expr.args)

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

# Mathematical expressions

def ans_expr(strans,sol,local_dict={},authorized_func={}):
    """
    Analyze an answer expected to be a mathematical expression.
    """
    try:
        ans=str2expr(strans)
    except:
        return (-1,"FailedConversion","Votre réponse n'est pas une expression valide.")
    if not is_equal(ans,sol):
        return (0,"NotEqual","")
    nonauthorized_func=set([type(a) for a in ans.atoms(sp.Function)]).difference(authorized_func)
    if nonauthorized_func!=set():
        return (-1,"UnauthorizedFunction","Fonctions non-autorisées")
    if not is_rat_simp(ans):
        return (-1,"NotRatSimp","Certains nombres ne sons pas simplifiés.")
    return (100,0,"")


def ans_tuple_expr(strans,sol,parenthese_enclosed=True,local_dict={},authorized_func={}):
    """
    Analyze a tuple of algebraic expressions.
    """
    if isinstance(strans,(tuple,list)):
        ans=[]
        for item in strans:
            ans.append(str2expr(item,local_dict))
    elif isinstance(strans,string):
        if parenthese_enclosed:
            delim="("
        try:
            ans=str2listexpr(strans,delim,local_dict)
        except:
            return (-1,"FailedConversion","Votre réponse n'est pas un n-uplet.")
    if len(ans)!=len(sol):
        return (0,"IncorrectLength","")
    for i in range(len(ans)):
        if not is_equal(ans[i],sol[i]):
            return (0,"NotEqual","")
    for i in range(len(ans)):
        nonauthorized_func=set([type(a) for a in ans[i].atoms(sp.Function)]).difference(authorized_func)
        if nonauthorized_func!=set():
            return (-1,"UnauthorizedFunction",str(ans[i]))
        if not is_rat_simp(ans[i]):
            return (-1,"NotRatSimp","Certains nombres ne sont pas simplifiés.")
    return (100,"","")

def ans_set_expr(strans,sol,brace_enclosed=True,local_dict={},authorized_func={}):
    """
    Analyze a set of algebraic expressions.
    """
    if brace_enclosed:
        delim="{"
    else:
        delim=""
    try:
        ans=str2listexpr(strans,delim,local_dict)
    except:
        return (-1,"FailedConversion","Votre réponse n'est pas un ensemble.")
    for i in range(len(ans)):
        for j in range(i+1,len(ans)):
            if is_equal(ans[i],ans[j]):
                return (-1,4,"Il y a des doublons.")
    if len(ans)!=len(sol):
        return (0,"NotEqual","")
    for i in range(len(ans)):
        isin = False
        for obj in sol:
            if is_equal(ans[i],obj):
                isin=True
                break
        if not isin:
            return (0,"NotEqual","")
    for i in range(len(ans)):
        nonauthorized_func=set([type(a) for a in ans[i].atoms(sp.Function)]).difference(authorized_func)
        if nonauthorized_func!=set():
            return (-1,"UnauthorizedFunction",str(ans[i]))
        if not is_rat_simp(ans[i]):
            return (-1,"NotRatSimp","Certains nombres ne sont pas simplifiés.")
    return (100,"","")

# Integer and fractions

def is_frac_int(expr):
    """
    Check if a sympy expression is a fraction of integers.
    """
    args=arg_mul_flatten(expr)
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
    args=arg_mul_flatten(expr)
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

def ans_frac(strans,sol):
    """
    Analyze an answer expected to be a fraction.
    """
    try:
        ans=str2expr(strans)
    except:
        return (-1,1,"Votre réponse n'est pas une fraction d'entiers ou un entier.")
    if not is_frac_int(ans):
        return (-1,2,"Votre réponse n'est pas une fraction d'entiers ou un entier.")
    if not is_equal(ans,sol):
        return (0,"NotEqual","")
    if not is_frac_irred(ans):
        return (-1,4,"Votre réponse n'est pas une fraction irréductible.")
    return (100,0,"")

def ans_frac_irred(strans,sol):
    """
    Analyze an answer of type fraction.
    """
    try:
        ans=str2expr(strans)
    except:
        return (-1,1,"Votre réponse n'est pas une fraction d'entiers ou un entier.")
    if not is_frac_int(ans):
        return (-1,2,"Votre réponse n'est pas une fraction d'entiers ou un entier.")
    if not is_frac_irred(ans):
        return (0,4,"Votre réponse n'est pas une fraction irréductible.")
    if not is_equal(ans,sol):
        return (0,"NotEqual","")
    return (100,0,"")


# Real numbers

def ans_real(strans,sol,local_dict={},authorized_func={}):
    return ans_expr(strans,sol,local_dict,authorized_func)

def ans_real_extended(strans,sol,local_dict={},authorized_func={}):
    """
    Analyze an answer of type limit.
    """
    strans=strans.replace("\infty", "oo")
    return ans_expr(strans,sol,local_dict,authorized_func)

def ans_angle_rad(strans,sol,local_dict={},authorized_func={}):
    return 0

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

def is_complex_cartesian(expr):
    """
    Check if a complex number is in cartesian form.
    """
    args=arg_add_flatten(expr)
    ni=sum([is_coeff_mul(a,sp.I) for a in args])
    nr=sum([a.is_real for a in args])
    return ni<=1 and ni+nr==len(args)
    
def complex_cartesian_parts(expr):
    """
    Check if a complex number is in cartesian form.
    """
    args=arg_add_flatten(expr)
    im=next(coeff_mul(a,sp.I) for a in args if is_coeff_mul(a,sp.I))
    lstre=[a for a in args if a.is_real]
    if len(lstre)==0:
        re=0
    elif len(lstre)==1:
        re=lstre[0]
    else:
        with sp.evaluate(False):
            re=sp.Add(*lstre)
    return (re,im)

def ans_complex_cartesian(strans,sol,imaginary_unit):
    """
    Analyze an answer of type complex number in cartesian form.
    """
    try:
        ans=str2expr(strans,{imaginary_unit:sp.I})
    except:
        return (-1,1,"Votre réponse n'est pas un nombre complexe valide.")
    if not ans.is_complex:
        return (-1,2,"Votre réponse n'est pas un nombre complexe valide.")
    if not is_complex_cartesian(ans):
        return (-1,3,"Votre réponse n'est pas un nombre complexe écrit sous forme cartésienne.")
    if not is_equal(ans,sol):
        return (0,4,"")
    (rpart,ipart)=complex_cartesian_parts(ans)
    if (rpart.is_rational and not is_frac_int_irred(rpart)) or (ipart.is_rational and not is_frac_int_irred(ipart)):
        return (-1,5,"La partie réelle et/ou la partie imaginaire de votre réponse n'est pas simplifiée.") 
    return (100,0,"")
  
# Real sets

def ans_real_set(strans,sol):
    """
    Analyze an answer of type interval.
    """
    try:
        ans=str2realset(strans)
    except:
        return (-1,"FailedConversion","Votre réponse n'est pas un ensemble valide.")
    for i in range(len(ans)):
        for j in range(i+1,len(ans)):
            if sp.Intersection(ans[i],ans[j])!=sp.EmptySet():
                return (-1,"NonDisjoint","Cette réunion d'ensembles peut-être simplifiée.")
    if sp.simplify(sp.Union(*ans))!=sol:
        return (0,"NotEqual","")
    for i in range(len(ans)):
        if not is_rat_simp(ans[i]):
            return (-1,"NotRatSimp","Certains expressions numériques ne sont pas simplifiés.")
    return (100,0,"")

# Polynomials

def is_poly_expanded(expr,x):
    """
    Check if a sympy polynomial is written in expanded form.
    """
    args=arg_add_flatten(expr)
    return all(is_coeff_exponent(a,x) for a in args)

def ans_poly_expanded(strans,sol,x):
    try:
        ans=str2expr(strans)
    except:
        return (-1,1,"Votre réponse n'est pas un polynôme.")
    if not ans.is_polynomial(x):
        return (-1,2,"Votre réponse n'est pas un polynôme.")
    if not is_poly_expanded(ans,x):
        return (-1,3,"Votre réponse n'est pas développée.")
    if not is_equal(ans,sol):
        return (0,4,"")
    with sp.evaluate(False):
        coeffs=sp.Poly(ans,x).all_coeffs()
    if any(is_rat_simp(c) for c in coeffs):
        return (-1,5,"Ceraines expressions numériques peuvent être simplifiées.") 
    return (100,0,"")


def is_poly_factor(expr,x,domain):
    """
    Check if a sympy polynomial is factorized.
    """
    args=arg_mul_flatten(expr)
    for a in args:
        if type(a)==sp.Pow:
            a=a.args[0]
        if not sp.Poly(a,x,domain=domain).is_irreducible:
            return False
    return True

def ans_poly_factor(strans,sol,x,domain='RR'):
    try:
        ans=str2expr(strans)
    except:
        return (-1,3,"Votre réponse n'est pas un polynôme.")
    if not is_poly_factor(ans,x,domain):
        return (-1,3,"Votre réponse n'est pas factorisée.")
    if not is_equal(ans,sol):
        return (0,"NotEqual","")
    if not is_rat_simp(ans):
        return (-1,5,"Ceraines expressions numériques peuvent être simplifiées.") 
    return (100,"","")




def ans_chained_ineq(strans,sol,local_dict={},authorized_func={}):
    """
    Analyze an answer expected to be chained inequalities.
    """
    try:
        ans=str2chainineq(strans)
    except:
        return (-1,"FailedConversion","Votre réponse n'est pas un encadrement.")
    if not (is_equal(ans[0],sol[0]) and is_equal(ans[4],sol[4])):
        return (0,"WrongBounds","Les bornes ne sont pas correctes.")
    if not (ans[1]==sol[1] and ans[3]==sol[3]):
        return (0,"WrongIneq","Les types d'inégalités ne sont pas corrects.")
    return (100,0,"")



