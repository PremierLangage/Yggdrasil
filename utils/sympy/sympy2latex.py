import sympy as sp
from sympy.printing.latex import LatexPrinter

class CustomLatexPrinter(LatexPrinter):
    """ 
    A custom LaTeX printer for SymPy objects.

    This printer is based on the standard LaTeX Printer.
    It overrides some methods and adds some settings.
    """
    printmethod = ""

    _default_custom_settings = {'interv_rev_brack': False}

    @classmethod
    def _get_initial_custom_settings(cls):
        return cls._default_custom_settings.copy()

    def __init__(self, settings=None):
        custom_settings = self._get_initial_custom_settings()
        for k, v in custom_settings.items():
            custom_settings[k] = settings.pop(k, v)
        super().__init__(settings)
        self._custom_settings = custom_settings

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
                if self._custom_settings["interv_rev_brack"] == True:
                    left = ']'
                else:
                    left = '('
            else:
                left = '['
    
            if i.right_open:
                if self._custom_settings["interv_rev_brack"] == True:
                    right = '['
                else:
                    right = ')'
            else:
                right = ']'
    
            return r"\left%s%s, %s\right%s" % \
                    (left, self._print(i.start), self._print(i.end), right)

    def _print_ImaginaryUnit(self, expr):
        return self._settings['imaginary_unit_latex']

    def _print_Infinity(self, expr):
        return r"+\infty"

    def _print_NegativeInfinity(self, expr):
        return r"-\infty"
    
    def _print_Pi(self, expr):
        return r"\pi"

def latex(expr, **settings):
    """
    Return a LaTeX string for a SymPy object.
    """
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
    first = True
    for i in range(len(coeff)):
        if coeff[i] != 0:
            if not first and coeff[i] > 0:
                code += "+ "
            if coeff[i] == 1:
                code += vec[i]
            elif coeff[i] == -1:
                code+="-"+vec[i]
            else:
                code+=latex(coeff[i])+" "+vec[i]
            first = False
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
