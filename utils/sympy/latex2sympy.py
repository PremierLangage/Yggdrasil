import sympy as sp
import sympy.parsing.sympy_parser as prs
import re

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
    s=s.replace("\infty", "oo")
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

def str2struct(s,local_dict={},typestruct=""):
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


