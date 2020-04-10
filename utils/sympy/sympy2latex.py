import sympy as sp
from sympy.printing.latex import LatexPrinter
from sympy.core.compatibility import default_sort_key
#from latex_settings import latex_settings

class CustomLatexPrinter(LatexPrinter):
    
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

_custom_settings = {
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
    "imaginary_unit": "i"
}

def latex(expr):
    return CustomLatexPrinter(settings=_custom_settings).doprint(expr)

def latexsys(A,B,lstvar=['x','y','z','t','u','v','w']):
    n,m=A.shape
    code="\\\\begin{align}"
    for i in range(n):
        code+="&" + latex_lincomb(A[i,:],lstvar)
        if i<n-1:
            code+=" = "+latex(B[i])+" \\\\\\ "
        else: 
            code+=" = "+latex(B[i])+" \\\\end{align}"
    if n==1:
        return code
    else:
        return "\\left\lbrace %s \\right." % code 

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



