from io import StringIO
from sympy.plotting import plot
import matplotlib.ticker as ticker
from sympy import symbols

def fig2svg(fig, transparent=True, **kwargs):
    file = StringIO()
    fig.savefig(file, format='svg', transparent=transparent, **kwargs)
    width, height = fig.get_size_inches()
    width, height = 72*width, 72*height
    lines = file.getvalue().splitlines()
    for i, line in enumerate(lines):
        if line.startswith('<svg'):
            lines[i] = "<svg viewBox='0 0 %s %s'>" % (width, height)
            break

    return "\n".join(lines)

def plotsvg(expr, xlim=(-5,5), ylim=(-5,5) ):
    x = symbols('x')
    fig = plot(expr, (x,*xlim))._backend.fig
    ax = fig.gca()
    ax.grid(True)
    ax.set_xlim(*xlim)
    ax.set_ylim(*ylim)
    ax.xaxis.set_major_locator(ticker.MultipleLocator(1))
    ax.yaxis.set_major_locator(ticker.MultipleLocator(1))
    #ax.xaxis.set_major_locator(ticker.MaxNLocator(integer=True))
    #ax.yaxis.set_major_locator(ticker.MaxNLocator(integer=True))
    ax.set_xlabel('')
    ax.set_ylabel('')
    return fig2svg(fig)

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

import numpy as np

def easyplot(ax, expr, xmin, xmax, npts=3):
    sb = list(expr.free_symbols)
    t = np.linspace(xmin, xmax, npts)
    s = []
    for t0 in t:
        #s.append(expr.subs({sb[0]:t0}))
        s.append(a*t0+b)
    ax.plot(t, s)
    return t, s