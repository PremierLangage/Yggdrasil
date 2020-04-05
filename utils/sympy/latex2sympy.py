import sympy as sp
import sympy.parsing.sympy_parser as prs
import re

def str2sympy(s,local_dict={}):
    """
    Convert a string into a SymPy expression without simplification.

    >>> str2expr("x+3+2x")
    x + 2*x + 3
    
    >>> str2expr("2^3")
    2**3
    
    >>> str2expr("sin 2 pi")
    sin(2*pi)
    
    >>> str2expr("3!")
    factorial(3)
    
    >>> str2expr("1+i",{'i':sp.I})
    1 + I
    """
    s.strip()
    
    if s=="":
        return None
    
    transformations=prs.standard_transformations + (prs.implicit_multiplication_application,prs.convert_xor)
    
    with sp.evaluate(False):
        return prs.parse_expr(s,local_dict=local_dict,transformations=transformations,evaluate=False)


def latex2sympy(s,local_dict={}):
    """
    Convert a LaTeX string into a SymPy expression without simplification.

    >>> latex2sympy("\pi^{3}")
    pi**3
    
    >>> latex2sympy("-\infty")
    -oo
    
    >>> latex2sympy(r"\frac{2}{4}")
    2/4
    """
    
    # delete meaningless substrings
    lst=[r"\mleft", r"\mright", r"\left", r"\right"]
    for s1 in lst:
        s = s.replace(s1,"")
    
    # replace \frac{}{}
    pattern = re.compile(r'^(.*)\\frac\s*{((?:(?!frac).)*)}{((?:(?!frac).)*)}(.*)$')
    while pattern.search(s) is not None:
        s = pattern.sub(r"\1(\2)/(\3)\4", s)

    # replace some substrings
    lst=[(r"\infty", "oo"),
         (r"\times", "*"),
         (r"\arccos", "acos"),
         (r"\arcsin", "asin"),
         (r"\arctan", "atan"),
         (r"\lbrace","["),
         (r"\rbrace","]"),
         (r"\{","["),
         (r"\}","]"),
         (r"\emptyset","[]"),
         ("\\", " "),
         ("{", "("),
         ("}", ")")]
    for (s1,s2) in lst:
        s = s.replace(s1,s2)
    
    return str2sympy(s,local_dict)

def FiniteSet2struct(S):
    if  S == sp.EmptySet:
        return []
    elif isinstance(S,sp.Set):
        return [FiniteSet2struct(x) for x in S]
    elif isinstance(S,tuple):
        return tuple([FiniteSet2struct(x) for x in S])
    else:
        return S
