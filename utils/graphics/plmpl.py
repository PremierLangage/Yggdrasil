from io import StringIO
import numpy as np

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


def plot2svg(p, xlim=(-5,5), ylim=(-5,5)):
    x = symbols('x')
    p = plot((x**2, (x, 0, 3)), (x, (x, -5, 5)))
    p[1].line_color = 'red'
    fig = p._backend.fig
    return fig2svg(fig)

def plot2(a, b):
    return plot(a, b)

import matplotlib.pyplot as plt

import numpy as np

def easyplot(fig, expr, xmin, xmax, npts=3):
    """Add plot
    ax = fig.gca()
    sb = list(expr.free_symbols)
    t = np.linspace(xmin, xmax, npts)
    s = []
    for t0 in t:
        s.append(expr.subs({sb[0]:t0}))
    ax.plot(t, s)
