
# Equality tests

def equal(a, b, modulo=0):
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

def equal_struct(a, b, modulo=0):
    """
    Check if two structures are equal.
    """
    if isinstance(b,list):
        if isinstance (a,list):
            return equal_set(a,b)
    elif isinstance(b,tuple):
        if isinstance (a,tuple):
            return equal_tuple(a,b)
    elif isinstance(b,(sp.Expr,int)):
        if isinstance (a,(sp.Expr,int)):
            return equal(a, b, modulo)
    return False

def equal_set(p,q):
    """
    Check if two sets (stored as lists) are equal.
    """
    if len(p)!=len(q):
        return False
    for a in p:
        isin=False
        for b in q:
            if equal_struct(a,b):
                isin=True
                break
        if not isin:
            return False
    return True

def equal_tuple(p,q):
    """
    Check if two tuples are equal.
    """
    if len(p)!=len(q):
        return False
    for i in range(len(p)):
        if not equal_struct(p[i],q[i]):
            return False
    return True

def duplicates(struct):
    if isinstance(struct,list):
        if len(struct)>1:
            for i in range(len(struct)):
                for j in range(i+1,len(struct)):
                    if equal_struct(struct[i],struct[j]):
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
    Check if 
    """
    return isinstance(expr,sp.Expr)

def is_real_or_inf(expr):
    """
    Check if
    """
    if expr==sp.S.Infinity or expr==sp.S.NegativeInfinity:
        return True
    return (expr.is_real is True) and (expr.is_infinite is False)

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
    if not equal(ans,sol):
        return (0,"NotEqual","")
    for (f,score,error,feedback) in test2:
        if not f(ans):
                return (score,error,feedback)
    return (100,0,"")
    
def ans_eqconstant_(strans,sol,x,local_dict,test1,test2):
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
    if not (ans-sol).is_constant(x):
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
    if not equal_tuple(ans,sol):
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
    if not equal_set(ans,sol):
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
    if not equal_struct(ans,sol):
        return (0,"NotEqual","")
    return (100,"","")

def ans_struct_(strans,sol,typestruct,local_dict,test1,test2):
    if typestruct=="set":
        return ans_set_(strans,sol,True,local_dict,test1,test2)
    elif typestruct=="setwobraces":
        return ans_set_(strans,sol,False,local_dict,test1,test2)
    elif typestruct=="tuple":
        return ans_tuple_(strans,sol,True,local_dict,test1,test2)
    elif typestruct=="composite":
        return ans_composite_(strans,sol,local_dict,test1,test2)

#################
# Expression
#################

def ans_expr(strans,sol,local_dict={}):
    """
    Analyze an answer of type expr.
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

def eval_poly(strans,sol,x,domain="RR",imaginary_unit="i",form=""):
    """
    Analyze an answer of type polynomial.
    """
    local_dict={imaginary_unit:sp.I}
    try:
        ans=str2expr(strans,local_dict)
    except:
        return (-1,"NotExpr","Votre réponse n'est pas une expression valide.")
    if not ans.is_polynomial(x):
        return (-1,"NotPoly","Votre réponse n'est pas un polynôme.")
    if not only_authorized_func(ans,authorized_func):
        return (-1,"UnauthorizedFunc","Votre réponse utilise des fonctions non-autorisées.")
    if not equal(ans,sol):
        return (0,"NotEqual","")
    if form == "expanded":
        if is_poly_expanded(expr,x):
            return (-1,"NotExpanded","Votre réponse n'est pas un polynôme développé.")
    elif form == "facorized":
        if is_poly_factorized(expr,x,domain):
            return (-1,"NotFactorized","Votre réponse n'est pas un polynôme factorisé.")
    return (100,"Success","")

#############
# Extended reals
#############


def ans_real_or_inf(strans,sol,local_dict={}):
    """
    Analyze an answer of type extended real.
    """
    test1=[(is_expr,-1,"NotExpr","Votre réponse n'est pas une expression valide."),
           (is_real_or_inf,-1,"NotRealOrInf","Votre réponse n'est pas un nombre réel ou +$\infty$ ou $-\infty$.")]
    test2=[]
    test2.append((is_rat_simp,-1,"NotRatSimp","L'expression peut encore être simplifiée."))
    return ans_(strans,sol,local_dict,test1,test2)


def ans_antiderivative(strans,sol,x,local_dict={}):
    """
    Analyze an answer of type expr.
    """
    x=sp.Symbol('x')
    test1=[(is_expr,-1,"NotExpr","Votre réponse n'est pas une expression valide.")]
    test2=[]
    test2.append((is_rat_simp,-1,"NotRatSimp","L'expression peut encore être simplifiée."))
    return ans_eqconstant_(strans,sol,x,local_dict,test1,test2)




def eval_complex(strans,sol,imaginary_unit="i",form="",authorized_func={}):
    """
    Analyze an answer of type complex number.
    """
    local_dict={imaginary_unit:sp.I,'e':sp.E}
    try:
        ans=str2expr(strans,local_dict)
    except:
        return (-1,"NotExpr","Votre réponse n'est pas une expression valide.")
    if not ans.is_complex:
        return (-1,"NotCplx","Votre réponse n'est pas un nombre complexe.")
    if not only_authorized_func(ans,authorized_func):
        return (1,"UnauthorizedFunc","Votre réponse utilise des fonctions non-autorisées.")
    if not equal(ans,sol):
        return (0,"NotEqual","")
    if form == "cartesian":
        if is_complex_cartesian(ans):
            return (-1,"NotCplxCartesian","Votre réponse n'est pas un nombre complexe sous forme cartésienne.")
    elif form == "exponential":
        if is_complex_exponential(ans):
            return (-1,"NotCplxExponential","Votre réponse n'est pas un nombre complexe sous forme exponentielle.")
    return (100,"Success","")

