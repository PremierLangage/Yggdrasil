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

    def _print_FiniteSet(self, s):
        items = sorted(s, key=default_sort_key)
        items = ", ".join(map(self._print, items))
        return r"\{%s\}" % items

    def _print_Poly(self, poly):
        cls = poly.__class__.__name__
        terms = []
        for monom, coeff in poly.terms():
            s_monom = ''
            for i, exp in enumerate(monom):
                if exp > 0:
                    if exp == 1:
                        s_monom += self._print(poly.gens[i])
                    else:
                        s_monom += self._print(pow(poly.gens[i], exp))

            if coeff.is_Add:
                if s_monom:
                    s_coeff = r"\left(%s\right)" % self._print(coeff)
                else:
                    s_coeff = self._print(coeff)
            else:
                if s_monom:
                    if coeff is sp.S.One:
                        terms.extend(['+', s_monom])
                        continue

                    if coeff is sp.S.NegativeOne:
                        terms.extend(['-', s_monom])
                        continue

                s_coeff = self._print(coeff)

            if not s_monom:
                s_term = s_coeff
            else:
                s_term = s_coeff + " " + s_monom

            if s_term.startswith('-'):
                terms.extend(['-', s_term[1:]])
            else:
                terms.extend(['+', s_term])

        if terms[0] in ['-', '+']:
            modifier = terms.pop(0)

            if modifier == '-':
                terms[0] = '-' + terms[0]

        return ' '.join(terms)

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

def latexsys(A,B,lstvar=['x','y','z','t','u','v','w']):
    n,m=A.shape
    X=list(map(sp.symbols,lstvar[0:n]))
    lhs=A*sp.Matrix(X)
    code="\\left\lbrace \\\\begin{align}"
    for i in range(n):
        code+="&" + latex_lincomb(A[i,:],lstvar)
        if i<n-1:
            code+=" = "+latex(B[i])+" \\\\\\ "
        else: 
            code+=" = "+latex(B[i])+" \\\\end{align}\\right."
    return code

def latex_lincomb(coeff,vec):
    code=""
    first=True
    for i in range(len(coeff)):
        if coeff[i]!=0:
            if not first and coeff[i]>0:
                code+="+ "
            if coeff[i]==1:
                code+=vec[i]
            elif coeff[i]==-1:
                code+="-"+vec[i]
            else:
                code+=latex(coeff[i])+" "+vec[i]
            first=False
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
    s.strip()
    if s=="":
        return None
    s=s.replace(r"\mleft", "")
    s=s.replace(r"\mright", "")
    s=s.replace(r"\left", "")
    s=s.replace(r"\right", "")
    pattern = re.compile(r'^(.*)\\frac\s*{((?:(?!frac).)*)}{((?:(?!frac).)*)}(.*)$')
    while pattern.search(s) is not None:
        s = pattern.sub(r"\1(\2)/(\3)\4", s)
    s=s.replace("\\times", "*")
    s=s.replace('\\'," ")
    s=s.replace("{", "(")
    s=s.replace("}", ")")
    
    transformations=prs.standard_transformations + (prs.implicit_multiplication_application,prs.convert_xor)
    with sp.evaluate(False):
        return prs.parse_expr(s,local_dict=local_dict,transformations=transformations,evaluate=False)

def str2struct(s,local_dict={}):
    """
    Convert a latex string into a structured mathematical expression.
    """
    s=s.replace(r"\mleft", "")
    s=s.replace(r"\mright", "")
    s=s.replace(r"\left", "")
    s=s.replace(r"\right", "")
    s=s.replace(r"\lbrace",r"\{")
    s=s.replace(r"\rbrace",r"\}")
    s=s.strip()
    if s[0]=="(" and s[-1]==")" and "," in s[1:-1]:
        s=s[1:-1]
        lst=re.split(r',\s*(?![^()]*\))(?![^\{\}]*\\})', s)
        return tuple([str2struct(x,local_dict) for x in lst])
    elif s[:2]==r"\{" and s[-2:]==r"\}":
        s=s[2:-2]
        lst=re.split(r',\s*(?![^()]*\))(?![^\{\}]*\\})', s)
        return [str2struct(x,local_dict) for x in lst]
    else:
        if s==r"\emptyset":
            return []
        return str2expr(s,local_dict)

def str2rset(s,local_dict={}):
    """
    Convert a latex string into an interval reunion.
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
    pattern = re.compile(r'^\[(.*),(.*)\]$')
    if pattern.search(s) is not None:
        return sp.Interval(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))
    pattern = re.compile(r'^\[(.*),(.*)\[$')
    if pattern.search(s) is not None:
        return sp.Interval.Ropen(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))
    pattern = re.compile(r'^\](.*),(.*)\]$')
    if pattern.search(s) is not None:
        return sp.Interval.Lopen(str2expr(pattern.search(s).group(1)),str2expr(pattern.search(s).group(2)))
    pattern = re.compile(r'^\](.*),(.*)\[$')
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
    pattern1 = re.compile(r'^(.*)<=(.*)<=(.*)$')
    pattern2 = re.compile(r'^(.*)<(.*)<=(.*)$')
    pattern3 = re.compile(r'^(.*)<=(.*)<(.*)$')
    pattern4 = re.compile(r'^(.*)<(.*)<(.*)$')
    pattern5 = re.compile(r'^(.*)>=(.*)>=(.*)$')
    pattern6 = re.compile(r'^(.*)>=(.*)>(.*)$')
    pattern7 = re.compile(r'^(.*)>(.*)>=(.*)$')
    pattern8 = re.compile(r'^(.*)>(.*)>(.*)$')

    if pattern1.search(s) is not None:
        parts=[pattern1.search(s).group(1),'<=',pattern1.search(s).group(2),'<=',pattern1.search(s).group(3)]
    elif pattern2.search(s) is not None:
        parts=[pattern2.search(s).group(1),'<',pattern2.search(s).group(2),'<=',pattern2.search(s).group(3)]
    elif pattern3.search(s) is not None:
        parts=[pattern3.search(s).group(1),'<=',pattern3.search(s).group(2),'<',pattern3.search(s).group(3)]
    elif pattern4.search(s) is not None:
        parts=[pattern4.search(s).group(1),'<',pattern4.search(s).group(2),'<',pattern4.search(s).group(3)]
    elif pattern5.search(s) is not None:
        parts=[pattern5.search(s).group(3),'<=',pattern5.search(s).group(2),'<=',pattern5.search(s).group(1)]
    elif pattern6.search(s) is not None:
        parts=[pattern6.search(s).group(3),'<',pattern6.search(s).group(2),'<=',pattern6.search(s).group(1)]
    elif pattern7.search(s) is not None:
        parts=[pattern7.search(s).group(3),'<=',pattern7.search(s).group(2),'<',pattern7.search(s).group(1)]
    elif pattern8.search(s) is not None:
        parts=[pattern8.search(s).group(3),'<',pattern8.search(s).group(2),'<',pattern8.search(s).group(1)]
    
    return [str2expr(parts[0]),parts[1],str2expr(parts[2]),parts[3],str2expr(parts[4])]

def FiniteSet2struct(S):
    if S==sp.EmptySet():
        return []
    elif isinstance(S,sp.Set):
        return [FiniteSet2struct(x) for x in S]
    elif isinstance(S,tuple):
        return tuple([FiniteSet2struct(x) for x in S])
    else:
        return S

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

def rand_int_matrix(n,p,bound,excluded_values=[],sparsity=0):
    """
    Generate a random matrix with integer entries.
    """
    nbzero=int(sp.floor(sparsity*n*p))
    entries0=[0]*nbzero
    entries1=list_randint(n*p-nbzero,-bound,bound,excluded_values)
    entries=entries0+entries1
    rd.shuffle(entries)
    return sp.Matrix(n,p,entries)

def rand_int_matrix_invertible(n,bound,excluded_values=[],sparsity=0):
    """
    Generate an invertible random matrix with integer entries.
    """
    while True:
        M=rand_int_matrix(n,n,bound,excluded_values,sparsity)
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

################
# Equality tests
################

def is_equal(a, b, modulo=0):
    """
    Check if two expressions are equal after simplification.
    """
    if a==b:
        return True
    diff=a-b
    if diff.is_complex:
        diff=sp.expand_complex(diff)
    if modulo==0:
        return sp.simplify(diff) == 0
    else:
        return sp.simplify(diff) % modulo == 0

def is_equal_struct(a, b, modulo=0):
    """
    Check if two structures are equal.
    """
    if isinstance(b,list):
        if isinstance (a,list):
            return is_equal_set(a,b)
    elif isinstance(b,tuple):
        if isinstance (a,tuple):
            return is_equal_tuple(a,b)
    elif isinstance(b,sp.Expr):
        if isinstance (a,sp.Expr):
            return is_equal(a, b, modulo)
    return False

def is_equal_set(p,q):
    """
    Check if two sets (stored as lists) are equal.
    """
    if len(p)!=len(q):
        return False
    for a in p:
        isin=False
        for b in q:
            if is_equal_struct(a,b):
                isin=True
                break
        if not isin:
            return False
    return True

def is_equal_tuple(p,q):
    """
    Check if two tuples are equal.
    """
    if len(p)!=len(q):
        return False
    for i in range(len(p)):
        if not is_equal_struct(p[i],q[i]):
            return False
    return True

def duplicates(struct):
    if isinstance(struct,list):
        if len(struct)>1:
            for i in range(len(struct)):
                for j in range(i+1,len(struct)):
                    if is_equal_struct(struct[i],struct[j]):
                        return True
    if isinstance(struct,(list,tuple)):
        for a in struct:
            if duplicates(a):
                return True
    return False

################
# Utils
################

def arg_add_flatten(expr):
    """
    Flatten a nested sum and return the terms of this sum as a list.
    """
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
    """
    Flatten a nested product and return the factors of this product as a list.
    """
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
    """
    Check if an expression is of the form 'something times x'.
    """
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
    """
    Check if an expression is of the form 'something times x power something'.
    """
    n=sp.degree(expr,x)
    if n==0:
        return True
    args=arg_mul_flatten(expr)
    return args.count(x**n)==1 and sum([a.has(x) for a in args])==1

# Tests

def is_expr(expr):
    """
    Check if an expression is a polynomial in x.
    """
    return isinstance(expr,sp.Expr)

def is_rat_simp(expr):
    """
    Check if the rational numbers in a sympy expressions are simplified.
    """
    if isinstance(expr,sp.Expr):
        expr2=sp.simplify(expr)
        if expr2.is_rational:
            return is_frac_int_irred(expr)
        elif expr.is_Atom:
            return True
        elif expr.is_Boolean:
            return True
        else:
            return all(is_rat_simp(subexpr) for subexpr in expr.args)
    else:
        return True

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

# Complex numbers


def is_complex(expr):
    """
    Check if an expression is complex number.
    """
    return expr.is_complex

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
    Return the real and imaginary parts.
    """
    args=arg_add_flatten(expr)
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
    args=arg_mul_flatten(expr)
    if is_e_i_theta(args[-1]):
        for a in args[:-1]:
            if not a.is_real or not a>0:
                return False
        return True
    return False

def is_poly(expr,x):
    """
    Check if an expression is a polynomial in x.
    """
    return expr.is_polynomial(x)

def is_poly_expanded(expr,x):
    """
    Check if a polynomial is in expanded form.
    """
    args=arg_add_flatten(expr)
    return all(is_coeff_exponent(a,x) for a in args)

def is_poly_factorized(expr,x,domain):
    """
    Check if a polynomial is factorized.
    """
    args=arg_mul_flatten(expr)
    for a in args:
        if type(a)==sp.Pow:
            a=a.args[0]
        if not sp.Poly(a,x,domain=domain).is_irreducible:
            return False
    return True

def only_authorized_func(expr,authorized_func):
    nonauthorized_func=set([type(a) for a in expr.atoms(sp.Function)]).difference(authorized_func)
    return nonauthorized_func==set()

# Answer analysis

###################
# Generic functions
###################

def ans_(strans,sol,local_dict,test1,test2):
    """
    Analyze an expression.
    """
    try:
        ans=str2expr(strans,local_dict)
    except:
        return (-1,2,"Votre réponse n'est pas une expression valide.")
    for (f,score,error,feedback) in test1:
        if not f(ans):
                return (score,error,feedback)
    if not is_equal(ans,sol):
        return (0,"NotEqual","")
    for (f,score,error,feedback) in test2:
        if not f(ans):
                return (score,error,feedback)
    return (100,0,"")
    
def ans_tuple_(strans,sol,parenth_enclosed,local_dict,test1,test2):
    """
    Analyze a tuple.
    """
    try:    
        strans=strans.strip()
        if parenth_enclosed:
            ans=str2struct(strans,local_dict)
        else:
            if strans=="":
                ans=[]
            else:
                ans=str2struct("("+strans+")",local_dict)
    except:
        return (-1,"NotValidExpr","Votre réponse n'est pas une expression valide.")
    if not isinstance(ans,tuple):
        return (-1,2,"Votre réponse n'est pas un n-uplet.")
    for (f,score,error,feedback) in test1:
        for item in ans:
            if not f(item):
                    return (score,error,feedback)
    sol=tuple(sol)
    if not is_equal_tuple(ans,sol):
            return (0,"NotEqual","")
    for (f,score,error,feedback) in test2:
        for item in ans:
            if not f(item):
                    return (score,error,feedback)
    return (100,0,"")

def ans_set_(strans,sol,brace_enclosed,local_dict,test1,test2):
    """
    Analyze a set.
    """
    try:    
        strans=strans.strip()
        if brace_enclosed:
            if strans==r"\emptyset":
                ans=[]
            else:
                ans=str2struct(strans,local_dict)
        else:
            if strans=="":
                ans=[]
            else:
                ans=str2struct("\\{"+strans+"\\}",local_dict)
    except:
        return (-1,"NotValidExpr","Votre réponse n'est pas une expression valide.")
    if not isinstance(ans,list):
        return (-1,"NotSet","Votre réponse n'est pas un ensemble.")
    for (f,score,error,feedback) in test1:
        for item in ans:
            if not f(item):
                    return (score,error,feedback)
    if duplicates(ans):
        return (-1,"Duplicates","Il y a des doublons dans l'ensemble.")
    if not is_equal_set(ans,sol):
            return (0,"NotEqual","")
    for (f,score,error,feedback) in test2:
        if not f(ans):
                return (score,error,feedback)
    return (100,0,"")

def ans_composite_(strans,Sol,local_dict,test1,test2):
    """
    Analyze a finite set.
    """
    sol=FiniteSet2struct(Sol)
    try:
        ans=str2struct(strans,local_dict)
    except:
        return (-1,"NotValidExpr","Votre réponse n'est pas une expression valide.")        
    if duplicates(ans):
        return (-1,"Duplicates","Il y a des doublons dans un ensemble.")
    if not is_equal_struct(ans,sol):
        return (0,"NotEqual","")
    return (100,"","")

def ans_struct_(strans,sol,typestruct,local_dict,test1,test2):
    if typestruct=="set":
        return ans_set_(strans,sol,True,local_dict,test1,test2)
    elif typestruct=="setwobraces":
        return ans_set_(strans,sol,False,local_dict,test1,test2)
    elif typestruct=="tuple":
        return ans_tuple_(strans,sol,local_dict,test1,test2)
    elif typestruct=="composite":
        return ans_composite_(strans,sol,local_dict,test1,test2)

#################
# Expression
#################

def ans_expr(strans,sol,local_dict={}):
    """
    Analyze an answer of type complex number.
    """
    test1=[(is_expr,-1,"NotExpr","Votre réponse n'est pas une expression valide.")]
    test2=[]
    test2.append((is_rat_simp,-1,"NotRatSimp","L'expression peut encore être simplifiée."))
    return ans_(strans,sol,local_dict,test1,test2)

def ans_struct_expr(strans,sol,typestruct,local_dict={}):
    test1=[(is_expr,-1,"NotExpr","Votre réponse n'est pas une expression valide.")]
    test2=[]
    test2.append((is_rat_simp,-1,"NotRatSimp","L'expression peut encore être simplifiée."))
    return ans_struct_(strans,sol,typestruct,local_dict,test1,test2)

#################
# Complex numbers
#################

def ans_complex(strans,sol,imaginary_unit="i",form="",authorized_func={}):
    """
    Analyze an answer of type complex number.
    """
    local_dict={imaginary_unit:sp.I,'e':sp.E}
    test1=[
        (is_complex,-1,"NotCplx","Votre réponse n'est pas un nombre complexe."),
        (lambda expr : only_authorized_func(expr,authorized_func),-1,"UnauthorizedGunc","Votre réponse utilise des fonctions non-autorisées.")
    ]
    if form=="cartesian":
        test1.append((is_complex_cartesian,-1,"NotCplxCartesian","Votre réponse n'est pas un nombre complexe sous forme cartésienne."))
    elif form=="exponential":
        test1.append((is_complex_exponential,-1,"NotCplxExponential","Votre réponse n'est pas un nombre complexe sous forme exponentielle."))
    test2=[]
    if form=="cartesian":
        test2.append((is_complex_cartesian_ratsimp,-1,"NotRatSimp","L'expression peut encore être simplifiée."))

    return ans_(strans,sol,local_dict,test1,test2)

def ans_struct_complex(strans,sol,typestruct,imaginary_unit="i",form=""):
    local_dict={imaginary_unit:sp.I}
    test1=[(is_complex,-1,"NotCplx","Une des expressions n'est pas un nombre complexe.")]
    if form=="cartesian":
        test1.append((is_complex_cartesian,-1,"NotCplxCartesian","Un des nombres n'est pas écrit sous forme cartésienne."))
    test2=[]
    return ans_struct_(strans,sol,typestruct,local_dict,test1,test2)

#############
# Polynomials
#############

def ans_poly(strans,sol,x,domain="RR",imaginary_unit="i",form=""):
    """
    Analyze an answer of type complex number.
    """
    local_dict={imaginary_unit:sp.I}
    test1=[(lambda expr : is_poly(expr,x),-1,"NotPoly","Votre réponse n'est pas un polynôme.")]
    if form=="expanded":
        test1.append((lambda expr : is_poly_expanded(expr,x),-1,"NotExpanded","Votre réponse n'est pas un polynôme développé."))
    if form=="factorized":
        test1.append((lambda expr : is_poly_factorized(expr,x,domain),-1,"NotFactorized","Votre réponse n'est pas un polynôme factorisé."))
    test2=[]
    return ans_(strans,sol,local_dict,test1,test2)





