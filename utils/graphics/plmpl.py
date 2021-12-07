from io import StringIO
import numpy as np
from sympy import Expr

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
    if isinstance(f, Expr)
    sb = list(expr.free_symbols)
    t = np.linspace(xmin, xmax, npts)
    s = []
    for t0 in t:
        s.append(expr.subs({sb[0]:t0}))
    ax.plot(t, s)
