import sympy as sp
from sympy.printing.latex import LatexPrinter
from sympy.core.compatibility import default_sort_key

class CustomLatexPrinter(LatexPrinter):
    """ 
    A custom LaTeX printer for SymPy objects.

    This printer is based on the standard LaTeX Printer.
    It overrides some methods and adds some settings.
    """

    def __init__(self, settings=None):
        custom_settings = {}
        custom_settings['interv_rev_brack'] = settings.pop('interv_rev_brack', False)
        LatexPrinter.__init__(self, settings)
        self.custom_settings = custom_settings

    def _print_Poly(self, poly):
        """
        Return a LaTeX code for a Poly object.

        Modification : No reference to the polynomial domain.
        """
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
        """
        Return a LaTeX code for an Interval object.

        Modification : Reverse bracket notation for open bounds.
        """
        if i.start == i.end:
            return r"\left\{%s\right\}" % self._print(i.start)
            
        else:
            if i.left_open:
                if self.custom_settings["interv_rev_brack"] == True:
                    left = ']'
                else:
                    left = '('
            else:
                left = '['
    
            if i.right_open:
                if self.custom_settings["interv_rev_brack"] == True:
                    right = '['
                else:
                    right = ')'
            else:
                right = ']'
    
            return r"\left%s%s, %s\right%s" % \
                    (left, self._print(i.start), self._print(i.end), right)

    def _print_Float(self, expr):
        # Based off of that in StrPrinter
        dps = prec_to_dps(expr._prec)
        strip = False if self._settings['full_prec'] else True
        low = self._settings["min"] if "min" in self._settings else None
        high = self._settings["max"] if "max" in self._settings else None
        str_real = mlib_to_str(expr._mpf_, dps, strip_zeros=strip, min_fixed=low, max_fixed=high)

        # Must always have a mul symbol (as 2.5 10^{20} just looks odd)
        # thus we use the number separator
        separator = self._settings['mul_symbol_latex_numbers']

        if 'e' in str_real:
            (mant, exp) = str_real.split('e')

            if exp[0] == '+':
                exp = exp[1:]
            if self._settings['decimal_separator'] == 'comma':
                mant = mant.replace('.','{,}')

            return r"%s%s10^{%s}" % (mant, separator, exp)
        elif str_real == "+inf":
            return r"+ \infty" # Here is the modification
        elif str_real == "-inf":
            return r"- \infty"
        else:
            if self._settings['decimal_separator'] == 'comma':
                str_real = str_real.replace('.','{,}')
            return str_real

def latex(expr, **settings):
    """
    Return a LaTeX string for a SymPy object.
    """
    # settings.update({"ln_notation": True})
    if isinstance(expr, list):
        return [latex(a) for a in expr]
    elif isinstance(expr, str):
        expr = expr.replace("<=",r"\le")
        expr = expr.replace(">=",r"\ge")
        return expr
    else:
        return CustomLatexPrinter(settings).doprint(expr)

def latex_linsys(A, B, lstvar=['x','y','z','t','u','v','w']):
    """
    Return a LaTeX string for a linear system.
    """
    if not isinstance(A, sp.Matrix):
        A = sp.Matrix(A)
    if not isinstance(B, sp.Matrix):
        B = sp.Matrix(B)

    n, m = A.shape
    
    terms = []
    for i in range(n):
        terms.extend(["&", latex_lincomb(A[i,:], lstvar)])
        if i < n-1:
            terms.extend(["=", latex(B[i]), r"\\"])
        else:
            terms.extend(["=", latex(B[i])])
    if n == 1:
        return " ".join(terms[1:])
    else:
        return r"\left\lbrace \begin{align} %s \end{align} \right. " % " ".join(terms) 

def latex_lincomb(coeff, vec):
    """
    Return a LaTeX string for a linear combination.
    """
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

def latex_chainineq(expr, interv):
    """
    Return a LaTeX string for a chained inequality.
    """
    elem = [latex(interv.start)]
    if interv.left_open:
        elem.append("<")
    else:
        elem.append("\leq")
    elem.append(latex(expr))
    if interv.right_open:
        elem.append("<")
    else:
        elem.append("\leq")
    elem.append(latex(interv.end))
    return " ".join(elem)
