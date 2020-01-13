extends = /Mathematics/template/mathinput.pl

title = Système linéaire


before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON
input.value=r"\lbrace ? | ? \in \R \rbrace"
n=2
m=3
coeffbound = 4
A=rand_int_matrix_fullrank(n,m,coeffbound)
B=rand_int_matrix(n,1,coeffbound)
sys_tex=latexsys(A,B)
lstvar=["x","y","z","t","u","v"]

==

text ==
Déterminer les solutions du système
$$ {{sys_tex}} $$
==

evaluator ==
def str2affsubset(s,local_dict={}):
    s=s.replace(r"\left", "")
    s=s.replace(r"\right", "")
    s=s.replace(r"\lbrace","{")
    s=s.replace(r"\rbrace","}")
    s.strip()
    pattern = re.compile(r'\s*\{(.*)\|(.*)\s*\\in\s*\\R\s*\}\s*')
    s1=pattern.search(s).group(1)
    lst2=pattern.search(s).group(2).split(",")
    lstvar=[sp.Symbol(item.strip()) for item in lst2]
    transformations=prs.standard_transformations + (prs.implicit_multiplication_application,prs.convert_xor)
    with sp.evaluate(False):
        vec=prs.parse_expr(s1,local_dict=local_dict,transformations=transformations,evaluate=False)
    pt=sp.Matrix([[sp.Poly(expr,lstvar).coeff_monomial(1) for expr in vec]]).transpose()
    span = [sp.Matrix([[sp.Poly(expr,lstvar).coeff_monomial(v) for expr in vec]]).transpose() for v in lstvar]
    return pt,span

def ans(strans,A,B):
    """
    Analyze a set.
    """
    try:    
        pt,span=str2affsubset(input.value)
    except:
        return (-1,"NotValidExpr","Votre réponse n'est pas écrit sous la bonne forme.")
    if A*pt != B:
        return (0,"","point")
    if not all([A*v != 0 for v in span]):
        return (0,"","span")
    return (100,"Ok","")

#str(A*pt)

score,_,feedback=ans(input.value,A,B)
==

input.debug % true
