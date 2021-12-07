from io import StringIO
import numpy as np
from sympy import Expr
from sympy.utilities.lambdify import lambdify

def fig2svg(fig, transparent=True, **kwargs):
    """Convert a matplolib figure into a HTML/SVG code."""
    file = StringIO()
    fig.savefig(file, format='svg', transparent=transparent, **kwargs)
    width, height = fig.get_size_inches()
    width, height = 72*width, 72*height
    lines = file.getvalue().splitlines()
    # HACK to remove fixed size
    for i, line in enumerate(lines):
        if line.startswith('<svg'):
            lines[i] = "<svg viewBox='0 0 %s %s'>" % (width, height)
            break
    return "\n".join(lines)

def easyplot(fig, f, xmin, xmax, npts=100):
    """Plot a function in a matplotlib figure.

    Parameters:
    - fig : matplotlib figure
    - f : a SymPy expression or a function
    """
    ax = fig.gca()
    if isinstance(f, Expr):
        # f is SymPy expression
        sb = list(expr.free_symbols)
        if len(sb) == 0:
            x = [xmin, xmax]
            y = [f.evalf(), f.evalf()]
            return None
        elif len(sb) == 1:
            var = sb[0]
            ff = lambdify(var, f)
    else:
        # f is a function
        ff = f
    x np.linspace(xmin, xmax, npts)
    y = [ff(x0) for x0 in x]
    ax.plot(x, y)
