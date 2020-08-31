import sympy as sp
import sympy.parsing.sympy_parser as prs
import re


def str2sympy(s, local_dict={}, evaluate=False):
    """
    Convert a string into an expression or a nested structure of
    lists and tuples of expressions.

    >>> str2sympy("x+3+2x")
    x + 2*x + 3
    
    >>> str2sympy("2^3")
    2**3
    
    >>> str2sympy("sin 2 pi")
    sin(2*pi)
    
    >>> str2sympy("3!")
    factorial(3)
    
    >>> str2sympy("1+i",{'i':sp.I})
    1 + I
    
    >>> str2sympy("{0, pi, 2 pi}")
    [0, pi, 2*pi]
    """
    s.strip()
    
    if s == "":
        return None

    s = s.replace("{", "[")
    s = s.replace("}", "]")
    
    global_dict = {}
    exec('from sympy import *', global_dict, global_dict)
    global_dict.update(local_dict)
    transformations=prs.standard_transformations + (prs.implicit_multiplication_application,prs.convert_xor)
    #transformations = (prs.standard_transformations + (prs.implicit_multiplication_application,))
    return prs.parse_expr(s,global_dict=global_dict,transformations=transformations,evaluate=evaluate)

def latex2str(s):
    r"""
    Convert a LaTeX string into a SymPy-readable string.

    >>> latex2str("e^{i \pi}")
    'e^(i  pi)'
        
    >>> latex2str("-\infty")
    '-oo'
    
    >>> latex2str(r"\frac{\pi}{4}")
    '( pi)/(4)'
    
    >>> latex2str(r"\left\{0, \frac{1}{2} \right\}")
    '{0, (1)/(2) }'
    """
    
    # delete meaningless substrings
    lst=[r"\mleft", r"\mright", r"\left", r"\right"]
    for s1 in lst:
        s = s.replace(s1, "")
    
    # replace \frac{}{}
    #pattern = re.compile(r'^(.*)\\frac\s*{((?:(?!frac).)*)}{((?:(?!frac).)*)}(.*)$')
    #while pattern.search(s) is not None:
    #    s = pattern.sub(r"\1(\2)/(\3)\4", s)

    # replace some substrings
    lst=[(r"\frac",""),
         (r"}{", ")/("),
         (r"} {", ")/("),
         (r"\{",r"\lbrace"),
         (r"\}",r"\rbrace"),
         ("{", "("),
         ("}", ")"),
         (r"\operatorname"," "),
         (r"\lbrace","{"),
         (r"\rbrace","}"),
         (r"\infty", "oo"),
         (r"\times", "*"),
         (r"\cdot", "*"),
         (r"\geq", ">="),
         (r"\leq", "<="),
         (r"\ge", ">="),
         (r"\le", "<="),
         (r"\arccos", "acos"),
         (r"\arcsin", "asin"),
         (r"\arctan", "atan"),
         (r"\emptyset","{}"),
         ("\\", " ")]
         
    for (s1,s2) in lst:
        s = s.replace(s1,s2)
        
    return s


def latex2sympy(s, local_dict={}):
    r"""
    Convert a LaTeX string into a SymPy expression without simplification.
    """
    return str2sympy(latex2str(s), local_dict)
    
def str2interval(s, notation="bracket", local_dict={}):
    """
    Convert a string into an interval.
    
    >>> str2interval("[3,4]")
    Interval(3, 4)
    
    >>> str2interval("]pi/4,pi/2]")
    Interval.Lopen(pi/4, pi/2)
    
    >>> str2interval("[1,oo[")
    Interval(1, oo)
    """
    # TODO : english notation
    # TODO : raise error when closed infinity endpoint
    # TODO : , or ; as separator ?
    s = s.strip()
    
    pattern = re.compile(r'^{(.*)}$')
    if pattern.search(s) is not None:
        return sp.FiniteSet(str2sympy(pattern.search(s).group(1)))
    pattern = re.compile(r'^\[(.*),(.*)\]$')
    
    if pattern.search(s) is not None:
        return sp.Interval(str2sympy(pattern.search(s).group(1)),str2sympy(pattern.search(s).group(2)))
        
    pattern = re.compile(r'^\[(.*),(.*)\[$')
    if pattern.search(s) is not None:
        return sp.Interval.Ropen(str2sympy(pattern.search(s).group(1)),str2sympy(pattern.search(s).group(2)))
        
    pattern = re.compile(r'^\](.*),(.*)\]$')
    if pattern.search(s) is not None:
        return sp.Interval.Lopen(str2sympy(pattern.search(s).group(1)),str2sympy(pattern.search(s).group(2)))
        
    pattern = re.compile(r'^\](.*),(.*)\[$')
    if pattern.search(s) is not None:
        return sp.Interval.open(str2sympy(pattern.search(s).group(1)),str2sympy(pattern.search(s).group(2)))
        
    raise ValueError()
    
def latex2interval(s, notation="bracket", local_dict={}):
    """
    Convert a latex string into an interval.
    
    >>> latex2interval("\\left\\[3,4\\right\\]")
    Interval(3, 4)
    
    >>> latex2interval("\\left\]\\pi/4,\\pi/2\\right\]")
    Interval.Lopen(pi/4, pi/2)
    
    >>> latex2interval("\\left\\[1,+\\infty\\right\\[")
    Interval(1, oo)
    """
    return str2interval(latex2str(s), notation=notation, local_dict=local_dict)
    
def latex2rset(s, local_dict={}):
    """
    Convert a latex string into an interval reunion.
    
    >>> latex2rset("\emptyset")
    [EmptySet()]
    """
    args = s.split(r"\cup")
    rset = []
    for a in args:
        if a.strip() == r"\emptyset":
            rset.append(sp.EmptySet)
        elif a.strip() == r"\R":
            rset.append(sp.S.Reals)
        else:
            rset.append(latex2interval(a))
    return rset

def FiniteSet2struct(S):
    if S == sp.EmptySet:
        return []
    elif isinstance(S, (sp.Set, set)):
        return [FiniteSet2struct(x) for x in S]
    elif isinstance(S, tuple):
        return tuple([FiniteSet2struct(x) for x in S])
    else:
        return S





